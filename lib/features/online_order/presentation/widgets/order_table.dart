import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/custom_table_row.dart';

class OrderTable extends StatelessWidget {
  final Map<String, int> orderItems;
  const OrderTable({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTableRow(
          widget1: Text(
            'Item',
            textAlign: TextAlign.center,
            style: AppStyles.bold14(),
          ),
          widget2: Text(
            'Qty',
            textAlign: TextAlign.center,
            style: AppStyles.bold14(),
          ),
          widget3: Text(
            '',
            textAlign: TextAlign.center,
            style: AppStyles.bold14(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: orderItems.length,
            itemBuilder: (context, index) => CustomTableRow(
                  widget1: Text(
                    orderItems.keys.toList()[index],
                    textAlign: TextAlign.center,
                    style: AppStyles.medium14(),
                  ),
                  widget2: Text(
                    orderItems.values.toList()[index].toString(),
                    textAlign: TextAlign.center,
                    style: AppStyles.medium14(),
                  ),
                  widget3: BlocBuilder<OnlineOrderCubit, OnlineOrderState>(
                    builder: (context, state) {
                      final isChecked =
                          state.isDone![index];
                          return Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          BlocProvider.of<OnlineOrderCubit>(context)
                              .updateIsDone(
                            index,
                            value ?? false,
                          );
                        },
                      );
                    },
                  ),
                ))
      ],
    );
  }
}
