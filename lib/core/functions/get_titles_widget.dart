import 'package:flutter/material.dart';

Widget getTitlesWidget(value, meta) {
  switch (value.toInt()) {
    case 1:
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text("ًWeek 1"),
      );
    case 2:
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text("ًWeek 2"),
      );
    case 3:
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text("ًWeek 3"),
      );
    case 4:
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text("ًWeek 4"),
      );
    default:
      return Text("");
  }
}
