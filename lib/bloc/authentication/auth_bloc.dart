import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:realworld_app/bloc/authentication/auth_event.dart';
import 'package:realworld_app/bloc/authentication/auth_state.dart';
import 'package:realworld_app/constants/strings.dart';
import 'package:realworld_app/repository/auth_repository.dart';
// import 'package:realworld_app/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthUnknownState()) {
    on<AuthRegister>(_authRegisterHandler);
    on<AuthLogin>(_authLoginHandler);
    on<AuthLogout>(_authLogoutHandler);
    on<AuthGetCurrentUser>(_authGetCurrentUserHandler);

    add(AuthGetCurrentUser());
  }

  Future<void> _authRegisterHandler(
      AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthProgressingState());

    try {
      var user = await authRepository.postRegister(username: event.username, email: event.email, password: event.password);

      _authLoginHandler(AuthLogin.user(user), emit);
    } on DioException catch (e) {
      _dioErrorHandler(e);
    } catch (e) {
      emit(AuthUnknownState.error(
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _authLoginHandler(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthProgressingState());

    try {
      if (event.user == null)
        event.user = await authRepository.postLogin(email: event.email, password: event.password);
    } on DioException catch (e) {
      // event.user = UserModel(email: 'test@gdsc.com', username: 'doldamul', token: 'abcdefgh');
      _dioErrorHandler(e);
      return;
    } catch (e) {
      emit(AuthUnknownState.error(
        errorMessage: e.toString(),
      ));
      return;
    }

    const storage = FlutterSecureStorage();
    await storage.write(
      key: Strings.jwtToken,
      value: event.user!.token,
    );

    emit(AuthAuthenticatedState(user: event.user!));
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
    const _storage = FlutterSecureStorage();
    final isLoggedIn = await _storage.containsKey(key: Strings.jwtToken);
    if (!isLoggedIn) return;

    try {
      var res = await authRepository.getCurrentUser();

      await _authLoginHandler(
        AuthLogin.user(res),
        emit,
      );
    } on DioException catch (e) {
      _dioErrorHandler(e);
    } catch (e) {
      emit(AuthUnknownState.error(
        errorMessage: e.toString(),
      ));
    }
  }

  void _dioErrorHandler(DioException e) {
    if (e.response != null) {
      emit(AuthUnknownState.error(
        errorMessage: e.response!.data.toString(),
      ));
    } else {
      emit(AuthUnknownState.error(
        errorMessage: e.message ?? e.type.toString(),
      ));
    }
  }
}