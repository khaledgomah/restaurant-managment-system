import 'dart:io';
import 'package:dio/dio.dart';
import 'package:restaurant_system/features/checkout/constants.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  Future<Response> request(
    String endpoint,
    String token,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl:CheckoutConstants. baseUrl,
          contentType: contentType ?? Headers.jsonContentType,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
