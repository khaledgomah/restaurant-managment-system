import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class MealsStaisticsHeader extends StatelessWidget {
  const MealsStaisticsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesMeal),
        Text(
          'Meals',
          style: AppStyles.regular12(),
        )
      ],
    );
  }
}
