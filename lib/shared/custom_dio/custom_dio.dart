import 'package:dio/dio.dart';
import 'package:login_flutter/shared/constantes.dart';
import 'package:login_flutter/shared/custom_dio/custom_interceptors.dart';

class CustomDio {
  Dio dio;

  CustomDio(this.dio) {
    dio.options.baseUrl = BASE_URL;
    dio.options.connectTimeout = 5000;
    dio.interceptors.add(CustomInterceptops(dio));
  }
}
