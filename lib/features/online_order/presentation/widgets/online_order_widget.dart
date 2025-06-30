// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';

class OnlineOrderWidget extends StatelessWidget {
  const OnlineOrderWidget(
      {super.key, required this.order, required this.isSelected});
  final bool isSelected;
  final OnlineOrder order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isSelected ? AppColors.primaryColor : AppColors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order #${order.orderId}',
            style: AppStyles.bold12()
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
          Text(
            DateFormat('HH:mm').format(order.createdAt.toDate()),
            style: AppStyles.regular12()
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            'Number of items: ',
            style: AppStyles.bold12()
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
          Text(
            order.order.keys.length.toString(),
            style: AppStyles.regular12()
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
        ],
      ),
      onTap: () {
        // Handle order tap
      },
    );
  }
}
