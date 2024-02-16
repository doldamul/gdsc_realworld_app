import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';
import 'package:realworld_app/bloc/authentication/auth_state.dart';
import 'package:realworld_app/constants/strings.dart';
import 'package:realworld_app/repository/auth_repository.dart';
import 'package:realworld_app/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthUnknownState()) {
    on<AuthRegister>(_authRegisterHandler);
    on<AuthLogin>(_authLoginHandler);
    on<AuthLogout>(_authLogoutHandler);
    on<AuthGetCurrentUser>(_authGetCurrentUserHandler);
  }

  Future<void> _authRegisterHandler(
      AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    UserModel user = await authRepository.postRegister(username: event.username, email: event.email, password: event.password);

    _authLoginHandler(AuthLogin.user(user), emit);
  }

  Future<void> _authLoginHandler(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    UserModel user;

    if (event.user == null)
      user = await authRepository.postLogin(email: event.email, password: event.password);
    else
      user = event.user!;

    const storage = FlutterSecureStorage();
    await storage.write(
      key: Strings.jwtToken,
      value: user.token,
    );

    emit(AuthAuthenticatedState(user: user));
  }

  Future<void> _authLogoutHandler(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: Strings.jwtToken);

    emit(AuthUnknownState());
  }

  Future<void> _authGetCurrentUserHandler(
    AuthGetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    try {
      var res = await authRepository.getCurrentUser();

      await _authLoginHandler(
        AuthLogin.user(res),
        emit,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        emit(AuthErrorState(
          message: e.response!.data.toString(),
        ));
      } else {
        emit(AuthErrorState(
          message: e.message ?? e.type.toString(),
        ));
      }
    } catch (e) {
      emit(AuthErrorState(
        message: e.toString(),
      ));
    }
  }
}