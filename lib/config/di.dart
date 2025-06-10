import 'package:get_it/get_it.dart';
import 'package:restaurant_system/core/data/repo/repo.dart';
import 'package:restaurant_system/core/data/sources/sources.dart';
import 'package:restaurant_system/core/network/api.dart';
import 'package:restaurant_system/features/checkout/data/sources/sources.dart';
import 'package:restaurant_system/features/checkout/data/repositories/repositories_impl.dart';
import 'package:restaurant_system/features/dashboard/data/repo/repo.dart';
import 'package:restaurant_system/features/dashboard/data/sources/sources.dart';

final instance = GetIt.instance;

void init() {
  instance.registerLazySingleton(() => APIService());
  instance.registerLazySingleton(() => DashboardRemoteDataSource());
  instance.registerLazySingleton(() => CoreRemoteDataSource());
  instance.registerLazySingleton(() => DashboardRepository(instance()));
  instance.registerLazySingleton(() => CoreRepository(instance()));
  instance.registerLazySingleton(() => CheckoutRepositoryImp(instance()));
  instance.registerLazySingleton(() => CheckoutRemoteDataSource(instance()));
}
