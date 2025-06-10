import 'package:dartz/dartz.dart';
import 'package:restaurant_system/core/data/sources/sources.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/core/errors/failure.dart';

class CoreRepository {
  CoreRemoteDataSource coreRemoteDataSource;
  CoreRepository(this.coreRemoteDataSource);
  final List<ItemModel> _meals = [];
  final List<ItemModel> _burgers = [];
  final List<ItemModel> _sandwitchs = [];
  final List<ItemModel> _sides = [];
  Map<String, List<ItemModel>> data = {};
  Future<Either<Failure, Map<String, List<ItemModel>>>> getItemsData() async {
    var response = await coreRemoteDataSource.getItemsData();
    response.fold(
      (l) {
        return l;
      },
      (data) {
        for (var item in data['meals']) {
          _meals.add(ItemModel.fromMap(item as Map<String, dynamic>));
        }

        for (var item in data['burgers']) {
          _burgers.add(ItemModel.fromMap(item as Map<String, dynamic>));
        }
        for (var item in data['sandwitchs']) {
          _sandwitchs.add(ItemModel.fromMap(item as Map<String, dynamic>));
        }

        for (var item in data['sides']) {
          _sides.add(ItemModel.fromMap(item as Map<String, dynamic>));
        }
      },
    );
    data.addAll({
      'meals': _meals,
      'burgers': _burgers,
      'sandwitchs': _sandwitchs,
      'sides': _sides,
    });

    return right(data);
  }


}
