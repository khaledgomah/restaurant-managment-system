import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/data/models/total_widget_model.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/total_widget.dart';

class DashboardHeaderBuilder extends StatelessWidget {
  const DashboardHeaderBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardFailure) {
          return Text('Sorry there was an error: ${state.failure.message}');
        } else if (state is DashboardSuccess) {
          return DashboardHeader(
              totalWidgetModelList: state.dashboardModel.totalWidgetModelsList);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

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
