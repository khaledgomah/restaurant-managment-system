import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/core/errors/firebase_failure.dart';

class CoreRemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getItemsData() async {
    List burgers = [];
    List meals = [];
    List sides = [];
    List sandwitchs = [];
    try {
      var response = FirebaseFirestore.instance
          .collection('total_items')
          .doc('total_items_doc');
      var documentSnapshot = await response.get();
      burgers = documentSnapshot.data()!['burgers'] as List;
      meals = documentSnapshot.data()!['meals'] as List;
      sides = documentSnapshot.data()!['sides'] as List;
      sandwitchs = documentSnapshot.data()!['sandwitchs'] as List;
    } on Exception catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
    Map<String, dynamic> data = {
      'sandwitchs': sandwitchs,
      'meals': meals,
      'burgers': burgers,
      'sides': sides
    };

    return right(data);
  }
}
