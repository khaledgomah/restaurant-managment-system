import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/complete_order.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/order_table.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/price_order.dart';

class CurrentOrderSection extends StatelessWidget {
  const CurrentOrderSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
      builder: (context, state) {
        if (state.selectedOrder != null) {
          return Container(
            padding: EdgeInsets.only(top: 34, left: 10, right: 10, bottom: 20),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Order #${state.selectedOrder!.orderId}",
                  style: AppStyles.bold20(),
                ),
                SizedBox(
                  height: 20,
                ),
                OrderTable(
                  orderItems: state.selectedOrder!,
                ),
                Spacer(),
                state.selectedOrder!.status == 'pending'
                    ? CompleteOrder(
                        id: state.selectedOrder!.orderId,
                        isAvailable: !state.isDone!.contains(false),
                      )
                    : PriceOrder(
                        price: state.selectedOrder!.price,
                      ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
