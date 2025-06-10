import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/statistics.dart';
import 'package:restaurant_system/config/app_colors.dart';

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
    return Scaffold(
      backgroundColor: AppColors.backGroundcolor,
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 146,
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  return CustomDashboardDrawer();
                },
              ),
            ),
            SizedBox(
              width: 22,
            ),
            Expanded(flex: 509, child: Dashboard()),
            SizedBox(
              width: 22,
            ),
            Expanded(flex: 309, child: Statistics()),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
