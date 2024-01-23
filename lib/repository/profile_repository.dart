import 'package:dio/dio.dart';
import 'package:realworld_app/interceptors/no_auth_interceptor.dart';
import 'package:realworld_app/models/profile_model.dart'; // 구현 예정

class ProfileRepository {
  Future<ProfileModel> getProfile(String username) async {
    Dio dio = Dio();
    dio.interceptors.add(NoAuthInterceptor());

    var res = await dio.get('/api/profiles/$username');

    return ProfileModel.fromJson(res.data['profile']);
  }
}