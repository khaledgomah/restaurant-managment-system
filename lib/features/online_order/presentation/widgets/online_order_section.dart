import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/core/custom_widgets/live_clock.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/orders_list_view.dart';

class OnlineOrdersSection extends StatefulWidget {
  const OnlineOrdersSection({super.key});

  @override
  State<OnlineOrdersSection> createState() => _OnlineOrdersSectionState();
}

class _OnlineOrdersSectionState extends State<OnlineOrdersSection> {
  bool isPending = true;
  @override
  void initState() {
    context.read<OnlineOrderCubit>().getPendingOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
      builder: (context, state) {
        if (state.ordersStates == OrdersStates.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.ordersStates == OrdersStates.failure) {
          return Center(child: Text('Failed to load orders'));
        }
        return ListView(
          children: [
             LiveClock(),
            SizedBox(height: 16),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(AppColors.black),
                    ),
                    onPressed: () {
                      isPending = true;
                      context.read<OnlineOrderCubit>().getPendingOrders();
                    },
                    child: Text(
                      'Pending',
                      style: isPending
                          ? AppStyles.bold16()
                              .copyWith(decoration: TextDecoration.underline)
                          : AppStyles.regular16(),
                    )),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(AppColors.black),
                    ),
                    onPressed: () {
                      isPending = false;
                      context.read<OnlineOrderCubit>().getCompletedOrders();
                    },
                    child: Text(
                      'Completed',
                      style: isPending
                          ? AppStyles.regular16()
                          : AppStyles.bold16()
                              .copyWith(decoration: TextDecoration.underline),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            OrdersListView(
                orders: isPending
                    ? state.pendingOrders ?? []
                    : state.completedOrders ?? []),
          ],
        );
      },
    );
  }
}
