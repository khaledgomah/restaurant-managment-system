import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/core/functions/format_date.dart';

class LiveClock extends StatefulWidget {
  const LiveClock({super.key});

  @override
  State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          formatDate(_now),
          style: AppStyles.bold16(),
        ),
        Text(
          formatTime(_now),
          style: AppStyles.regular16(),
        ),
      ],
    );
  }
}
