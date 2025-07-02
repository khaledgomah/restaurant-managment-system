// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/online_order_widget.dart';

class OrdersListView extends StatelessWidget {
  final List<OnlineOrder> orders;
  const OrdersListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
      builder: (context, state) {
        final selectedOrder = state.selectedOrder;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final isSelected = selectedOrder != null && selectedOrder.orderId == order.orderId;
            return OnlineOrderWidget(
              onSelected: () {
                BlocProvider.of<OnlineOrderCubit>(context)
                    .changeSelectedOrder(order);
              },
              isSelected: isSelected,
              order: order,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        );
      },
    );
  }
}
