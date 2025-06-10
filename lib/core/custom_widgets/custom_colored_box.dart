import 'package:flutter/material.dart';

class CustomColoredBox extends StatelessWidget {
  const CustomColoredBox({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 29,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
    );
  }
}
