import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/features/dashboard/data/models/total_widget_model.dart';

class DashboardModel {
  final Map<String, List<ItemModel>> items;
  final List<TotalWidgetModel> totalWidgetModelsList;

  DashboardModel({required this.items, required this.totalWidgetModelsList});
}
