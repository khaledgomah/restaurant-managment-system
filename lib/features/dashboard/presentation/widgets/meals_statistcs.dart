import 'package:flutter/material.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/meals_staistics_header.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/meals_statistics_body.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/meals_statistics_footed.dart';

class MealsStatistcs extends StatelessWidget {
  const MealsStatistcs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealsStaisticsHeader(),
        SizedBox(
          height: 30,
        ),
        MealsStatisticsBody(),
        SizedBox(
          height: 20,
        ),
        MealsStatisticsFooted()
      ],
    );
  }
}
