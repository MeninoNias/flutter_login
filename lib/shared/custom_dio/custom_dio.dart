import 'package:dio/dio.dart';
// import 'package:login_flutter/shared/constantes.dart';
import 'package:login_flutter/shared/custom_dio/custom_interceptors.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
    // dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = 5000;
    _dio.interceptors.add(CustomInterceptops(_dio));
  }

  Dio get getInstance => _dio;
}
