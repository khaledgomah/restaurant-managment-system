import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';

abstract class OnlineOrderRepository {
  Future<Either<Failure,List<OnlineOrder>>> getCompletedOrders();
  Future<Either<Failure,List<OnlineOrder>>> getPendingOrders();
  Future<Either<Failure, void>> completeOrder(int orderId);
}