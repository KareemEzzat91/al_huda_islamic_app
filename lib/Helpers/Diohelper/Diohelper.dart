import 'package:dio/dio.dart';

class Diohelper {
  static Dio? _dio;
  Diohelper._();
  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/users",
        receiveTimeout: const Duration(
          seconds: 60,
        ),
      ),
    );
  }

  static Future<Response> getData({
    String path="https://jsonplaceholder.typicode.com/users",
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = _dio!.get(path, queryParameters: queryParameters);
    return response;
  }

}
