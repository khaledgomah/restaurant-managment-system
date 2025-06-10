import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/core/functions/get_titles_widget.dart';

class BurgersStatisticsBody extends StatelessWidget {
  const BurgersStatisticsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: BarChart(
        duration: Duration(milliseconds: 150),
        curve: Curves.linear,
        BarChartData(
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => AppColors.black,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(rod.toY.toString(),
                    AppStyles.bold16().copyWith(color: AppColors.white));
              },
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.lightGrey),
            ),
          ),
          groupsSpace: 10,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getTitlesWidget,
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: [
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  toY: 10,
                  width: 19,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 3,
                  width: 19,
                  color: AppColors.darkSecondary,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 15,
                  width: 19,
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(4)),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  toY: 10,
                  width: 19,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 3,
                  width: 19,
                  color: AppColors.darkSecondary,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 15,
                  width: 19,
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(4)),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  toY: 10,
                  width: 19,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 3,
                  width: 19,
                  color: AppColors.darkSecondary,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 15,
                  width: 19,
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(4)),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                  toY: 10,
                  width: 19,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 3,
                  width: 19,
                  color: AppColors.darkSecondary,
                  borderRadius: BorderRadius.circular(4)),
              BarChartRodData(
                  toY: 15,
                  width: 19,
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(4)),
            ]),
          ],
        ),
      ),
    );
  }
}
