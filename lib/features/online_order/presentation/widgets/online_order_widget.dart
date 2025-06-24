// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';

class OnlineOrderWidget extends StatelessWidget {
  const OnlineOrderWidget({super.key, required this.order});

  final OnlineOrder order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Order #${order.orderId}'),
          Text(DateFormat('HH:mm').format(order.createdAt.toDate())),
        ],
      ),
      subtitle: Text('Number of items: ${order.order.keys.length}'),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        // Handle order tap
      },
    );
  }
}
