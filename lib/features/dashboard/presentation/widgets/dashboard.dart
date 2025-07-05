import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboar_body.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard_header.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardFailure) {
          return Text('Sorry there was an error: ${state.failure.message}');
        } else if (state is DashboardSuccess) {
          List<ItemModel> data = [];
          state.dashboardModel.items.forEach(
            (key, value) => data.addAll(value),
          );
          data.sort(
            (a, b) => b.orders.compareTo(a.orders),
          );
          final visibleItems = data.take(state.visibleCount).toList();

          return Column(
            children: [
              //LiveClock(),
              DashboardHeader(
                  totalWidgetModelList:
                      state.dashboardModel.totalWidgetModelsList),
              DashboarBody(
                list: visibleItems,
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
