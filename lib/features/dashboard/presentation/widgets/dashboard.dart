import 'package:flutter/material.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboar_body.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/dashboard_header.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeaderBuilder(),
        DashboarBodyBuilder(),
      ],
    );
  }
}
