import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/core/functions/format_date.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/orders_list_view.dart';

class OnlineOrderSection extends StatelessWidget {
  const OnlineOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatDate(DateTime.now()),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text('Pending')),
            TextButton(onPressed: () {}, child: Text('Completed')),
          ],
        ),
        OrdersListView(orders: [
          // Sample data for demonstration purposes
          OnlineOrder(
            status: 'Pending',
            orderId: '1',
            createdAt: Timestamp.now(),
            order: {'item1': 2, 'item2': 1},
          ),
          OnlineOrder(
            status: 'Completed',
            orderId: '2',
            createdAt: Timestamp.now(),
            order: {'item3': 1},
          ),
          OnlineOrder(
            status: 'Pending',
            orderId: '3',
            createdAt: Timestamp.now(),
            order: {'item1': 1, 'item4': 3},
          ),
        ]),
      ],
    );
  }
}
