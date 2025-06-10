import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/order_number.dart';
import 'package:restaurant_system/config/app_colors.dart';

class NewOrderConfirmBody extends StatelessWidget {
  const NewOrderConfirmBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewOrderCubit, NewOrderState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 10,
              color: AppColors.lightGrey,
            ),
            itemCount: state.selling.length,
            itemBuilder: (context, index) => OrderNumber(
              item: state.selling[index],
            ),
          );
        },
      ),
    );
  }
}
