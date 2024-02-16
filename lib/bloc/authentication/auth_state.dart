import 'package:equatable/equatable.dart';
import 'package:realworld_app/models/user_model.dart';

abstract class AuthState extends Equatable {}

class AuthUnknownState extends AuthState {
  AuthUnknownState();

  @override
  List<Object?> get props => [];
}

class AuthAuthenticatedState extends AuthState {
  final UserModel user;

  AuthAuthenticatedState({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}