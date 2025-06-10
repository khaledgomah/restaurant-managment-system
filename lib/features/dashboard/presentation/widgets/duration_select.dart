import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/features/dashboard/presentation/widgets/duration_item.dart';

class DurationSelect extends StatefulWidget {
  const DurationSelect({
    super.key,
  });
  @override
  State<DurationSelect> createState() => _DurationSelectState();
}

class _DurationSelectState extends State<DurationSelect> {
  final List<String> list = ['this week', 'This month', 'this year'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Row(
          children: List.generate(list.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<DashboardCubit>(context)
                      .getDashboardData(index);
                },
                child: DurationItem(
                  text: list[index],
                  isSelected:
                      BlocProvider.of<DashboardCubit>(context).duration ==
                          index,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
