import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/features/dashboard/data/models/total_widget_model.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({super.key, required this.totalWidgetModel});

  final TotalWidgetModel totalWidgetModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            totalWidgetModel.iconPath,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                totalWidgetModel.value,
                style: AppStyles.bold16().copyWith(color: AppColors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                totalWidgetModel.title,
                style: AppStyles.regular12().copyWith(color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
