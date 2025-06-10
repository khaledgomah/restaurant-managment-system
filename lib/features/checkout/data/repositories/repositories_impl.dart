import 'package:dartz/dartz.dart';
import 'package:restaurant_system/features/checkout/constants.dart';
import 'package:restaurant_system/features/checkout/data/models/auth/auth.dart';
import 'package:restaurant_system/features/checkout/data/models/order/order.dart';
import 'package:restaurant_system/core/errors/dio_failure.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/payment_status/payment_status_cubit.dart';

import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

int _orderId = 0;
String _authToken = '';

class CheckoutRepositoryImp implements CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;
  Future<bool> _isTokenValid(String token) async {
    try {
      final response =
          await remoteDataSource.testToken(token); // دالة بتعمل call بسيط
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  CheckoutRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, GetPaymentKeyResponse>> getPaymentKey(
      OrderRequest orderRequest) async {
    // ✅ Step 1: Check if token exists and is valid
    if (_authToken.isEmpty || !(await _isTokenValid(_authToken))) {
      final tokenResult = await remoteDataSource.getToken();

      final tokenResponse =
          await tokenResult.fold<Future<Either<Failure, String>>>(
        (failure) async => Future.value(Left(failure)),
        (tokenData) async {
          final auth = Auth.fromMap(tokenData);
          if (auth.token == null) {
            return Left(DioFailure(
                'Authentication failed: no token returned from Paymob'));
          }
          _authToken = auth.token!;
          return Right(_authToken);
        },
      );

      if (tokenResponse.isLeft()) {
        return Left((tokenResponse as Left).value);
      }
    }

    // ✅ Step 2: Create Order
    final orderResult =
        await remoteDataSource.makeOrder(_authToken, orderRequest);

    return await orderResult.fold(
      (failure) => Left(failure),
      (orderData) async {
        final order = OrderResponse.fromMap(orderData);
        _orderId = order.id!;

        // ✅ Step 3: Get Payment Key
        final paymentKeyRequest = PaymentKeyRequest(
          authToken: _authToken,
          currency: orderRequest.currency,
          amountCents: orderRequest.amountCents,
          orderId: _orderId,
          integrationId: CheckoutConstants.cardsPaymentIntegration,
          billingData: {
            "apartment": "803",
            "email": "test@user.com",
            "floor": "42",
            "first_name": "Test",
            "street": "Sample Street",
            "building": "8028",
            "phone_number": "+201000000000",
            "shipping_method": "PKG",
            "postal_code": "01898",
            "city": "Cairo",
            "country": "EG",
            "last_name": "User",
            "state": "Cairo"
          },
        );

        final paymentKeyResult =
            await remoteDataSource.getPaymentKey(_authToken, paymentKeyRequest);

        return paymentKeyResult.fold(
          (failure) => Left(failure),
          (paymentKeyData) {
            final String paymentToken = paymentKeyData['token'];
            return Right(GetPaymentKeyResponse(
              paymentToken,
              _orderId,
            ));
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, PaymentStatus>> getPaymentStatus() async {
    try {
      if (_authToken.isEmpty || !(await _isTokenValid(_authToken))) {
        final tokenResult = await remoteDataSource.getToken();
        final tokenEither =
            await tokenResult.fold<Future<Either<Failure, String>>>(
          (failure) async => Left(failure),
          (tokenData) async {
            final auth = Auth.fromMap(tokenData);
            if (auth.token == null) {
              return Left(DioFailure(
                  'Authentication failed: no token returned from Paymob'));
            }
            _authToken = auth.token!;
            return Right(_authToken);
          },
        );

        if (tokenEither.isLeft()) return Left((tokenEither as Left).value);
      }

      final response = await remoteDataSource.getOrderDetails(
          token: _authToken, orderId: _orderId);
      final String status = response['payment_status'] ;


      if (status == 'PAID') {
        return Right(PaymentStatus.success);
      } else {
        return Right(PaymentStatus.pending);
      } 
    } catch (e) {
      return Left(DioFailure("Failed to get payment status: $e"));
    }
  }
}

class GetPaymentKeyResponse {
  final String paymentKey;
  final int orderId;
  GetPaymentKeyResponse(this.paymentKey, this.orderId);
}
