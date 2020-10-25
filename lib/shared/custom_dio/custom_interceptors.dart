import 'package:dio/dio.dart';
// import 'package:login_flutter/login/login_repository.dart';
// import 'package:login_flutter/shared/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptops extends InterceptorsWrapper {
  Dio _dio;

  CustomInterceptops(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var token = preferences.getString("token");
    if (token != null) {
      _dio.lock();
      options.headers['Authorization'] = 'JWT ${token}';
      print(options.headers["Authorization"]);
      _dio.unlock();
    }
    // else {
    //   _dio.lock();
    //   // Fazer a autenticação com sqlLite

    //   // LoginRepository().login() as UserModel;
    //   // token = preferences.get('token');
    //   _dio.unlock();
    // }

    return options;
  }

  @override
  Future onResponse(Response response) {
    print("RESPONSE - STATUS CODE: ${response.statusCode}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    return super.onError(err);
  }
}
