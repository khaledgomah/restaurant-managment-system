// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';

import 'package:restaurant_system/core/errors/failure.dart';
import 'package:restaurant_system/features/dashboard/data/models/sales_info_response.dart';
import 'package:restaurant_system/features/dashboard/data/sources/sources.dart';

class DashboardRepository {
  DashboardRemoteDataSource dashboardRemoteDataSource;
  DashboardRepository(
    this.dashboardRemoteDataSource,

  );
  Map<String, List<ItemModel>> data = {};


  Future<Either<Failure, SalesInfoResponse>> getSalesInfo() async {
    var response = await dashboardRemoteDataSource.getSalesInfo();
    return response.fold(
      (l) => left(l),
      (data) {
        return right(SalesInfoResponse.fromMap(data));
      },
    );
  }
}
