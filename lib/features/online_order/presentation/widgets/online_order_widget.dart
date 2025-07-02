// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/is_paid_widget.dart';

class OnlineOrderWidget extends StatelessWidget {
  const OnlineOrderWidget(
      {super.key, required this.order, required this.isSelected, required this.onSelected});
  final bool isSelected;
  final OnlineOrder order;
  final void Function() onSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      tileColor: isSelected ? AppColors.primaryColor : AppColors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
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
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
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
            Spacer(),
            Text(
              '\$${order.price}',
              style: AppStyles.bold12()
                  .copyWith(color: isSelected ? AppColors.white : null),
            ),
            SizedBox(
              width: 8,
            ),
            IsPaidWidget(isPaid: order.isPaid)
          ],
        ),
      ),
      onTap:onSelected
    );
  }
}
