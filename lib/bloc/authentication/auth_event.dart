import 'package:realworld_app/models/user_model.dart';

abstract class AuthEvent {}

class AuthRegister extends AuthEvent {
  final String email;
  final String password;
  final String username;

  AuthRegister({
    required this.email,
    required this.password,
    required this.username,
  });
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  UserModel? user;

  AuthLogin({
    required this.email,
    required this.password,
  });

  AuthLogin.user(this.user) : email = "", password = "";
}

class AuthLogout extends AuthEvent {}

class AuthGetCurrentUser extends AuthEvent {}