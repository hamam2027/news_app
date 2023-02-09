import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
      
    ));
  }

  static Future<Response> getdata({
    required String url,
    required Map<String, dynamic> query,
  }) {
    return dio.get(url, queryParameters: query);
  }
}


