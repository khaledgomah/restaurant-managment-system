import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class IsPaidWidget extends StatelessWidget {
  final bool isPaid;
  const IsPaidWidget({super.key, required this.isPaid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color:
              isPaid ? AppColors.successColor : AppColors.notificationsColor),
      child: Text(
        isPaid ? 'Paid' : 'Un Paid',
        style: AppStyles.bold12()
            .copyWith(color:  AppColors.white),
      ),
    );
  }
}
