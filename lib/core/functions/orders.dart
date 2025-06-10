import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_system/features/dashboard/data/models/order_model.dart';

Future<void> addOrderToHive(Order order) async {
  final box = Hive.box<Order>('pendingOrders');
  await box.add(order);
}

List<Order> getAllOrders() {
  final box = Hive.box<Order>('pendingOrders');
  return box.values.toList();
}

Future<void> clearOrders() async {
  final box = Hive.box<Order>('pendingOrders');
  await box.clear();
}
