import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/custom_widgets/sidebar_layout.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/statistics.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<DashboardCubit>(context).getDashboardData(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarLayout(
        routeName: AppRoutes.dashboard,
        screen: Row(
          children: [
            Expanded(flex: 509, child: Dashboard()),
            SizedBox(
              width: 22,
            ),
            Expanded(flex: 309, child: Statistics()),
          ],
        ));
  }
}
