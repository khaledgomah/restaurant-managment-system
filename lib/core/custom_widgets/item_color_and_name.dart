import 'package:flutter/material.dart';
import 'package:restaurant_system/core/custom_widgets/custom_colored_box.dart';
import 'package:restaurant_system/config/app_styles.dart';

class ItemColorAndName extends StatelessWidget {
  const ItemColorAndName({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10.0),
      child: Row(
        children: [
          CustomColoredBox(color: color),
          SizedBox(
            width: 13,
          ),
          Text(
            title,
            style: AppStyles.regular12(),
          )
        ],
      ),
    );
  }
}
