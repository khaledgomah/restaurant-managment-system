// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class PriceOrder extends StatelessWidget {
  final num price;
  const PriceOrder({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryColor),
        padding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total ",
              style: AppStyles.regular16().copyWith(color: AppColors.white),
            ),
            Text(
              "\$$price",
              style: AppStyles.bold16().copyWith(color: AppColors.white),
            ),
          ],
        ));
  }
}
