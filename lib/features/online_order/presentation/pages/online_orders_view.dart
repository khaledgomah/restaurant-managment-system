import 'package:flutter/material.dart';
import 'package:restaurant_system/core/custom_widgets/sidebar_layout.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';

class OnlineOrdersView extends StatelessWidget {
  const OnlineOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarLayout(
      routeName: AppRoutes.onlineOrder,
      screen: Row(
        children: [
          Expanded(child: Placeholder()),
          SizedBox(width: 16),
          Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
