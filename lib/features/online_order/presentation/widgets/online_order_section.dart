import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/core/functions/format_date.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/orders_list_view.dart';

class OnlineOrderSection extends StatefulWidget {
  const OnlineOrderSection({super.key});

  @override
  State<OnlineOrderSection> createState() => _OnlineOrderSectionState();
}

class _OnlineOrderSectionState extends State<OnlineOrderSection> {
  bool isPending = true;
  @override
  void initState() {
    context.read<OnlineOrderCubit>().getPendingOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatDate(DateTime.now()),
          style: AppStyles.regular16(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  isPending = true;
                  context.read<OnlineOrderCubit>().getPendingOrders();
                },
                child: Text('Pending')),
            TextButton(
                onPressed: () {
                  isPending = false;
                  context.read<OnlineOrderCubit>().getCompletedOrders();
                },
                child: Text('Completed')),
          ],
        ),
        BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
          builder: (context, state) {
            if (state.ordersStates == OrdersStates.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.ordersStates == OrdersStates.failure) {
              return Center(child: Text('Failed to load orders'));
            }
            return OrdersListView(
                orders: isPending
                    ? state.pendingOrders ?? []
                    : state.completedOrders ?? []);
          },
        ),
      ],
    );
  }
}
