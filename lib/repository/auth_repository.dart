import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:realworld_app/interceptors/auth_interceptor.dart';
import 'package:realworld_app/interceptors/no_auth_interceptor.dart';
import 'package:realworld_app/models/user_model.dart';

class AuthRepository {
  Future<UserModel> postLogin({
    required String email,
    required String password,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(NoAuthInterceptor());

    Map<String, dynamic> body = {
      'user': {
        'email': email,
        'password': password,
      }
    };

    var res = await dio.post(
      '/api/users/login',
      data: jsonEncode(body),
    );

    return UserModel.fromJson(res.data['user']);
  }

  Future<UserModel> postRegister({
    required String email,
    required String password,
    required String username,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(NoAuthInterceptor());

    Map<String, dynamic> body = {
      'user': {
        'username': username,
        'email': email,
        'password': password,
      }
    };

    var res = await dio.post(
      '/api/users',
      data: jsonEncode(body),
    );

    return UserModel.fromJson(res.data['user']);
  }

  Future<UserModel> getCurrentUser() async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());

    var res = await dio.get('/api/user');

    return UserModel.fromJson(res.data['user']);
  }

  Future<UserModel> updateUser({
    String? email,
    String? password,
    String? username,
    String? bio,
    Uri? image,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());

    Map<String, dynamic> body = {
      'user': {
        if (username != null)
          'username': username,
        if (email != null)
          'email': email,
        if (password != null)
          'password': password,
        if (bio != null)
          'bio': bio,
        if (image != null)
          'image': image,
      }
    };

    var res = await dio.put(
      '/api/user',
      data: jsonEncode(body),
    );

    return UserModel.fromJson(res.data['user']);
  }
}