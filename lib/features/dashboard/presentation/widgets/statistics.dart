import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/burgers_statistics.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/duration_select.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/meals_statistcs.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 34, horizontal: 10),
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Overall',
                    style: AppStyles.bold20(),
                  ),
                  Text(' Statistics', style: AppStyles.regular20()),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.imagesSettings))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          DurationSelect(),
          SizedBox(
            height: 30,
          ),
          MealsStatistcs(),
          Divider(
            color: AppColors.lightGrey,
            height: 60,
          ),
          BurgersStatistics()
        ],
      ),
    );
  }
}
