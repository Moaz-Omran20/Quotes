import 'package:dio/dio.dart';
import 'package:quotes_api/api/constants.dart';

class Config {
  static Dio getDio() {
    BaseOptions options = BaseOptions(baseUrl: BASE);
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor());
    return dio;
  }
}
