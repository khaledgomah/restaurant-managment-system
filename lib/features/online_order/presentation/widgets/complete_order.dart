// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/features/online_order/presentation/cubit/online_order_cubit.dart';

class CompleteOrder extends StatelessWidget {
  final bool isAvailable;
  final int id;
  const CompleteOrder({super.key, required this.isAvailable, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isAvailable
          ? () {
              context.read<OnlineOrderCubit>().completeOrder(id);
            }
          : null,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isAvailable ? AppColors.primaryColor : AppColors.lightGrey,
          ),
          padding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 20),
          child: Row(
            children: [
              Text(
                "Complete",
                style: AppStyles.bold16().copyWith(
                    color: isAvailable ? AppColors.white : AppColors.grey),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios,
                  color: isAvailable ? AppColors.white : AppColors.grey)
            ],
          )),
    );
  }
}
