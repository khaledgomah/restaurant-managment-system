import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/core/errors/firebase_failure.dart';

class DashboardRemoteDataSource {

  Future<Either<Failure, Map<String, dynamic>>> getSalesInfo() async {
    Map<String, dynamic> data = {};
    try {
      var response = FirebaseFirestore.instance
          .collection('sales_info')
          .doc('sales_info_doc');
      var documentSnapshot = await response.get();
      data = documentSnapshot.data()!;
    } on Exception catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
    return right(data);
  }
}
