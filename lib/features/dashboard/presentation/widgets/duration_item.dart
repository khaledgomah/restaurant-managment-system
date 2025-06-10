// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class DurationItem extends StatelessWidget {
  const DurationItem({super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          text,
          style: AppStyles.regular12()
              .copyWith(color: isSelected ? AppColors.white : AppColors.black),
        ),
      ),
    );
  }
}
