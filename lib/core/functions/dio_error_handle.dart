import 'dart:io';

import 'package:dio/dio.dart';

String handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout. Please try again.";

    case DioExceptionType.sendTimeout:
      return "Request timeout while sending data.";

    case DioExceptionType.receiveTimeout:
      return "Server took too long to respond.";

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;

      switch (statusCode) {
        case 400:
          return "Invalid request. Please check your input.";
        case 401:
          return "Unauthorized. Please login again.";
        case 403:
          return "Forbidden. You don't have access to this resource.";
        case 404:
          return "Resource not found.";
        case 422:
          return "Unprocessable data. Please check your input.";
        case 500:
        case 501:
        case 502:
        case 503:
          return "Server error. Please try again later.";
        default:
          return "Unexpected error occurred (Status code: $statusCode).";
      }

    case DioExceptionType.cancel:
      return "Request was cancelled.";

    case DioExceptionType.unknown:
      if (e.error is SocketException) {
        return "No internet connection. Please check your network.";
      }
      return "Unexpected error occurred. Please try again.";

    default:
      return "Something went wrong. Please try again.";
  }
}
