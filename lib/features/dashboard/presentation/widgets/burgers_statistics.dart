import 'package:flutter/material.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/burger_statistics_footed.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/burger_statistics_header.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/burgers_statistics_body.dart';

class BurgersStatistics extends StatelessWidget {
  const BurgersStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BurgerStatisticsHeader(),
        SizedBox(
          height: 30,
        ),
        BurgersStatisticsBody(),
        BurgerStatisticsFooter()
      ],
    );
  }
}
