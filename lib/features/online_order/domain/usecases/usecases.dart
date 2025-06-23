import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/core/use_case/use_case.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/domain/repositories/repository.dart';


class OnlineOrderUseCases {
  final GetCompletedOrdersUsecase getCompletedOrders;
  final GetPendingOrdersUsecase getPendingOrders;
  final CompleteOrderUsecase completeOrder;

  OnlineOrderUseCases({
    required this.getCompletedOrders,
    required this.getPendingOrders,
    required this.completeOrder,
  });
}


class GetCompletedOrdersUsecase implements UseCase<List<OnlineOrder>, NoParams> {
  final OnlineOrderRepository onlineOrderRepository;
  GetCompletedOrdersUsecase(this.onlineOrderRepository);
  @override
  Future<Either<Failure, List<OnlineOrder>>> call(NoParams params) async {
    return await onlineOrderRepository.getCompletedOrders();
  }
}
class GetPendingOrdersUsecase implements UseCase<List<OnlineOrder>, NoParams> {
  final OnlineOrderRepository onlineOrderRepository;
  GetPendingOrdersUsecase(this.onlineOrderRepository);
  @override
  Future<Either<Failure, List<OnlineOrder>>> call(NoParams params) async {
    return await onlineOrderRepository.getPendingOrders();
  }
}

class CompleteOrderUsecase implements UseCase<void, String> {
  final OnlineOrderRepository onlineOrderRepository;
  CompleteOrderUsecase(this.onlineOrderRepository);
  
  @override
  Future<Either<Failure, void>> call(String orderId) async {
    return await onlineOrderRepository.completeOrder(orderId);
  }
}
