import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/core/functions/get_image_path.dart';

class DashboarBodyBuilder extends StatelessWidget {
  const DashboarBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardFailure) {
          return Text('Sorry there was an error: ${state.failure.message}');
        } else if (state is DashboardSuccess) {
          List<ItemModel> data = [];
          state.dashboardModel.items.forEach(
            (key, value) => data.addAll(value),
          );
          data.sort(
            (a, b) => b.orders.compareTo(a.orders),
          );
          final visibleItems = data.take(state.visibleCount).toList();

          return DashboarBody(
            list: visibleItems,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class DashboarBody extends StatelessWidget {
  const DashboarBody({super.key, required this.list});
  final List<ItemModel> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 35),
      color: AppColors.white,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 20, left: 20),
              child: Text(
                'Ordered Items',
                style: AppStyles.bold16(),
              ),
            ),
            Column(
              children: [
                // Header Row
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Item', style: AppStyles.bold12())),
                      Expanded(
                          child: Text('Orders', style: AppStyles.bold12())),
                      Expanded(child: Text('PPU', style: AppStyles.bold12())),
                      Expanded(
                          child: Text('Revenue', style: AppStyles.bold12())),
                    ],
                  ),
                ),

                const Divider(color: AppColors.lightGrey),

                // ListView.builder inside a limited height
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(getImagePath(item.type)),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: Text(item.name,
                                        style: AppStyles.regular12()),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(item.orders.toString(),
                                  style: AppStyles.bold12()),
                            ),
                            Expanded(
                              child: Text('\$${item.ppu}',
                                  style: AppStyles.regular12()),
                            ),
                            Expanded(
                              child: Text(
                                  '\$${(item.orders * item.ppu).truncate()}',
                                  style: AppStyles.bold12()),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () =>
                  BlocProvider.of<DashboardCubit>(context).showMoreItems(),
              child: Text("show more"),
            )
          ],
        ),
      ),
    );
  }
}
