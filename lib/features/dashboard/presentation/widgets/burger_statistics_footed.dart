import 'package:flutter/material.dart';
import 'package:restaurant_system/core/custom_widgets/item_color_and_name.dart';
import 'package:restaurant_system/config/app_colors.dart';

class BurgerStatisticsFooter extends StatelessWidget {
  const BurgerStatisticsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemColorAndName(
          color: AppColors.primaryColor,
          title: 'Big Mac McMeal',
        ),
        ItemColorAndName(
          color: AppColors.darkSecondary,
          title: 'Quarter Pounder McMeal',
        ),
        ItemColorAndName(
          color: AppColors.secondary,
          title: 'Chicken Deluxe McMeal',
        ),
      ],
    );
  }
}
