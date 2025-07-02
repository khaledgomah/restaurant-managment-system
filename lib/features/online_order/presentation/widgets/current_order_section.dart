import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/complete_order.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/order_table.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/price_order.dart';

class CurrentOrderSection extends StatelessWidget {
  final OnlineOrder? onlineOrder;
  const CurrentOrderSection({
    super.key,
    this.onlineOrder,
  });
  @override
  Widget build(BuildContext context) {
    if (onlineOrder != null) {
      return Container(
        padding: EdgeInsets.only(top: 34, left: 10, right: 10, bottom: 20),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Order #${onlineOrder!.orderId}",
              style: AppStyles.bold20(),
            ),
            SizedBox(
              height: 20,
            ),
            OrderTable(
              orderItems: onlineOrder!,
            ),
            Spacer(),
            BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
              builder: (context, state) {
                if (onlineOrder!.status == 'pending') {
                  return CompleteOrder(
                    isAvailable: !state.isDone!.contains(false),
                  );
                } else {
                  return PriceOrder(
                    price: onlineOrder!.price,
                  );
                }
              },
            )
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
