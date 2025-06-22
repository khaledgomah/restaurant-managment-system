import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/data/sources/online_order_sources.dart';
import 'package:restaurant_system/features/online_order/domain/repositories/repository.dart';

class OnlineOrderRepositoryImpl  implements OnlineOrderRepository {
  final OnlineOrderRemoteDataSource onlineOrderRemoteDataSource;

  OnlineOrderRepositoryImpl({required this.onlineOrderRemoteDataSource});

  @override
  Future<Either<Failure, List<OnlineOrder>>> getCompletedOrders() async {
    return await onlineOrderRemoteDataSource.getCompletedOrders();
  }

  @override
  Future<Either<Failure, List<OnlineOrder>>> getPendingOrders() async {
    return await onlineOrderRemoteDataSource.getPendingOrders();
  }

  @override
  Future<Either<Failure, void>> completeOrder(String orderId) async {
    return onlineOrderRemoteDataSource.completeOrder(orderId);
  }
}
