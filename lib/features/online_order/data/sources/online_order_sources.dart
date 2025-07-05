import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/core/errors/firebase_failure.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';

import '../../constants.dart';

class OnlineOrderRemoteDataSource {
  Future<Either<Failure, List<OnlineOrder>>> getCompletedOrders() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(OnlineOrderConstants.collectionName)
          .where('status', isEqualTo: 'completed')
          .get();

      final orders = snapshot.docs
          .map((doc) => OnlineOrder.fromMap(doc.data()))
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(FirebaseFailure('Failed to fetch completed orders: $e'));
    }
  } 
  Future<Either<Failure, void>> completeOrder(int orderId) async {
    try {
      await FirebaseFirestore.instance
          .collection(OnlineOrderConstants.collectionName)
          .doc(orderId.toString())
          .update({'status': 'completed'});
      return Right(null);
    } catch (e) {
      return Left(FirebaseFailure('Failed to make order complete: $e'));
    }
  }

  Future<Either<Failure, List<OnlineOrder>>> getPendingOrders() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(OnlineOrderConstants.collectionName)
          .where('status', isEqualTo: 'pending')
          .get();

      final orders = snapshot.docs
          .map((doc) => OnlineOrder.fromMap(doc.data()))
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(FirebaseFailure('Failed to fetch pending orders: $e'));
    }
  }
}
