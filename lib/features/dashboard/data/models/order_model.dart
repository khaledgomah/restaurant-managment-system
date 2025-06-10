import 'package:hive/hive.dart';
part 'order_model.g.dart';

@HiveType(typeId: 0)
class Order {
  @HiveField(0)
  final double price;
  @HiveField(1)
  final String type; //online or offline
  @HiveField(2)
  final Map<int, int> items; //key===> id value===>number of oreder

  Order(this.type, {required this.price, required this.items});
}
