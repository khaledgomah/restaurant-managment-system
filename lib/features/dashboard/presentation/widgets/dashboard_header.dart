import 'package:flutter/material.dart';
import 'package:restaurant_system/features/dashboard/data/models/total_widget_model.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/total_widget.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.totalWidgetModelList});
  final List<TotalWidgetModel> totalWidgetModelList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 49,
        ),
        Row(
            children: totalWidgetModelList.asMap().entries.map((entry) {
          int index = entry.key;
          TotalWidgetModel totalWidgetModel = entry.value;
          return Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 22),
              child: TotalWidget(
                totalWidgetModel: totalWidgetModel,
              ),
            ),
          );
        }).toList()),
      ],
    );
  }
}
