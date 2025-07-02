import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_colors.dart';

class CustomTableRow extends StatelessWidget {
  final Widget widget1, widget2;
  final Widget? widget3;
  const CustomTableRow(
      {super.key,
      required this.widget1,
      required this.widget2,
      this.widget3});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.zero,
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 184,
            child: Padding(padding: const EdgeInsets.all(8.0), child: widget1),
          ),
          Expanded(
            flex: 55,
            child: Padding(padding: const EdgeInsets.all(8.0), child: widget2),
          ),
          Expanded(
            flex: 30,
            child: Padding(padding: const EdgeInsets.all(8.0), child: widget3),
          )
        ],
      ),
    );
  }
}
