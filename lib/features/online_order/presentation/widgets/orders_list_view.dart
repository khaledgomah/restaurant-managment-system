// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/online_order_widget.dart';

class OrdersListView extends StatelessWidget {
  final List<OnlineOrder> orders;
  const OrdersListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OnlineOrderWidget(
          isSelected: index % 2 == 0,
          order: orders[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }
}
