import 'package:flutter/material.dart';
import 'package:restaurant_system/core/custom_widgets/custom_drawer.dart';
import 'package:restaurant_system/config/app_colors.dart';

class SidebarLayout extends StatelessWidget {
  final Widget screen;
  final String routeName;
  const SidebarLayout(
      {super.key, required this.screen, required this.routeName});

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
              child: CustomDrawer(routeName: routeName),
            ),
            SizedBox(
              width: 22,
            ),
            Expanded(flex: 830, child: screen),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
