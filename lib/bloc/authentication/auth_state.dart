import 'package:equatable/equatable.dart';
import 'package:realworld_app/models/user_model.dart';

abstract class AuthState extends Equatable {}

class AuthUnknownState extends AuthState {
  final String? errorMessage;

  AuthUnknownState() : errorMessage = null;
  AuthUnknownState.error({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AuthAuthenticatedState extends AuthState {
  final UserModel user;

  AuthAuthenticatedState({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}