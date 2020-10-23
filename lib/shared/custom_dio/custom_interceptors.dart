import 'package:dio/dio.dart';
import 'package:login_flutter/login/login_repository.dart';
import 'package:login_flutter/shared/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptops extends InterceptorsWrapper {
  final Dio _dio;

  CustomInterceptops(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var token = preferences.get("token");
    if (token = !null) {
      options.headers["Authorization"] = token;
      return super.onRequest(options);
    } else {
      _dio.lock();
      LoginRepository().login() as UserModel;
      token = preferences.get('token');
      _dio.unlock();
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    return super.onError(err);
  }
}
