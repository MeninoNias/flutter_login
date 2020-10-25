import 'package:dio/dio.dart';
import 'package:login_flutter/shared/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final Dio _dio = Dio();

  Future login(String username, String senha) async {
    try {
      var response = await _dio.post(
          'https://e-protocolo.herokuapp.com/api/login/',
          data: {"username": username, "password": senha});

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", response.data['token']);

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      print("Error ${e.toString()}");
      return null;
    }
  }
}
