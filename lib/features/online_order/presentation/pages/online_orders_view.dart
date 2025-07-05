import 'package:flutter/material.dart';
import 'package:restaurant_system/core/custom_widgets/sidebar_layout.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/current_order_section.dart';
import 'package:restaurant_system/features/online_order/presentation/widgets/online_order_section.dart';

class OnlineOrdersView extends StatelessWidget {
  const OnlineOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarLayout(
      routeName: AppRoutes.onlineOrder,
      screen: Row(
        children: [
          Expanded(flex: 509, child: OnlineOrdersSection()),
          SizedBox(width: 16),
          Expanded(flex: 309, child: CurrentOrderSection()),
        ],
      ),
    );
  }
}
