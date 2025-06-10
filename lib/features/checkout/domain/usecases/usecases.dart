import 'package:restaurant_system/core/use_case/use_case.dart';
import 'package:restaurant_system/features/checkout/data/repositories/repositories_impl.dart';
import 'package:restaurant_system/features/checkout/data/sources/sources.dart';
import 'package:restaurant_system/features/checkout/presentation/cubit/payment_status/payment_status_cubit.dart';

import '../repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';

class CheckoutUseCase implements UseCase<GetPaymentKeyResponse, OrderRequest> {
  final CheckoutRepository repository;

  CheckoutUseCase(this.repository);

  @override
  Future<Either<Failure, GetPaymentKeyResponse>> call(OrderRequest orderRequest) {
    return repository.getPaymentKey(orderRequest);
  }
}


class GetPaymentStatusUseCase implements UseCase<PaymentStatus, NoParams> {
  final CheckoutRepository repository;

  GetPaymentStatusUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentStatus>> call(NoParams params) {
    return repository.getPaymentStatus();
  }
  
}