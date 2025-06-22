import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:restaurant_system/features/checkout/constants.dart';
import 'package:restaurant_system/core/network/api.dart';
import 'package:restaurant_system/core/errors/dio_failure.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/core/functions/dio_error_handle.dart';

// enum PaymentMethods {wallets, cards}

class CheckoutRemoteDataSource {
  final APIService _apiService;
  CheckoutRemoteDataSource(this._apiService);
  Future<Response> testToken(String token) {
  return _apiService.request(
    'ecommerce/orders',
    token,
    DioMethod.get,
  );
}
  Future<Map<String, dynamic>> getOrderDetails({
    required String token,
    required int orderId,
  }) async {
    try {
      final response = await _apiService.request(
        'api/ecommerce/orders/$orderId',
        token,
        DioMethod.get,
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch order details: $e');
    }
  }


  Future<Either<Failure, Map<String, dynamic>>> getToken() async {
    try {
      var response = await _apiService.request(
          CheckoutConstants.getTokensPath, CheckoutConstants.publicKey, DioMethod.post,
          param: {"api_key": CheckoutConstants.publicKey});
      return Right(response.data);
    } on DioException catch (e) {
      var errorMessage = handleDioError(e);
      return Left(DioFailure(errorMessage));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> makeOrder(
      String key, OrderRequest orderRequest) async {
    try {
      var response = await _apiService.request(
          CheckoutConstants.makeOrderPath, key, DioMethod.post,
          param: orderRequest.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      var errorMessage = handleDioError(e);
      return Left(DioFailure(errorMessage));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getPaymentKey(
      String key, PaymentKeyRequest paymentKeyRequest) async {
    try {
      var response = await _apiService.request(
          CheckoutConstants.getPaymentKeyPath, key, DioMethod.post,
          param: paymentKeyRequest.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      var errorMessage = handleDioError(e);
      return Left(DioFailure(errorMessage));
    }
  }
}

class OrderRequest {
  final bool deliveryNeeded;
  final int amountCents;
  final String currency;
  final List items;

  OrderRequest(
      {this.items = const [],
      this.deliveryNeeded = false,
      required this.amountCents,
      required this.currency});

  Map<String, dynamic> toMap() {
    return {
      'delivery_needed': deliveryNeeded,
      'amount_cents': amountCents,
      'currency': currency,
      'items': items,
    };
  }
}

class PaymentKeyRequest {
  final String authToken;
  final String currency;
  final int amountCents;
  final int orderId;
  final int integrationId;
final Map<String, dynamic> billingData;
  PaymentKeyRequest( {
    required this.authToken,
    required this.currency,
    required this.amountCents,
    required this.orderId,
    required this.integrationId,
    required this.billingData,
  });

  PaymentKeyRequest copyWith({
    String? authToken,
    String? currency,
    int? amountCents,
    int? orderId,
    int? integrationId,
    Map<String, dynamic>? billingData,
  }) {
    return PaymentKeyRequest(
      billingData: billingData ?? this.billingData,
      authToken: authToken ?? this.authToken,
      currency: currency ?? this.currency,
      amountCents: amountCents ?? this.amountCents,
      orderId: orderId ?? this.orderId,
      integrationId: integrationId ?? this.integrationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auth_token': authToken,
      'currency': currency,
      'amount_cents': amountCents,
      'order_id': orderId,
      'integration_id': integrationId,
      'billing_data': billingData,
    };
  }
}


