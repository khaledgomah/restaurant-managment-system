import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:restaurant_system/config/app_colors.dart';

class SidebarLayout extends StatefulWidget {
  final Widget screen;
  final String routeName;
  const SidebarLayout({super.key, required this.screen, required this.routeName});

  @override
  State<SidebarLayout> createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> {
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
                  return CustomDashboardDrawer(routeName: widget.routeName);
                },
              ),
            ),
            SizedBox(
              width: 22,
            ),
            Expanded(flex: 830, child: widget.screen),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
