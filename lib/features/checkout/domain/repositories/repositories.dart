import 'package:dartz/dartz.dart';
import 'package:restaurant_system/features/checkout/data/repositories/repositories_impl.dart';
import 'package:restaurant_system/features/checkout/data/sources/sources.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/payment_status/payment_status_cubit.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, GetPaymentKeyResponse>> getPaymentKey(
      OrderRequest order);
  Future<Either<Failure, PaymentStatus>> getPaymentStatus();
}
