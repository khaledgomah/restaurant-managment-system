// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class CompleteOrder extends StatelessWidget {
  final bool isAvailable;
  const CompleteOrder({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
