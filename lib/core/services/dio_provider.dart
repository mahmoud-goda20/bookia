import 'package:bookia/core/services/app_endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;
  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
    ));
  }

  static Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) {
    return _dio.get(endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) {
    return _dio.post(endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers));
  }

  static Future<Response> put(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) {
    return _dio.put(endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers));
  }

  static Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) {
    return _dio.delete(endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers));
  }
}
