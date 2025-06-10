import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/features/dashboard/business_logic/dashboard/dashboard_cubit.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/core/custom_widgets/drawer_item_widget.dart';
import 'package:restaurant_system/config/assets.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';

class CustomDashboardDrawer extends StatefulWidget {
  const CustomDashboardDrawer({super.key});

  @override
  State<CustomDashboardDrawer> createState() => _CustomDashboardDrawerState();
}

class _CustomDashboardDrawerState extends State<CustomDashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems =
        BlocProvider.of<DashboardCubit>(context).getDrawerItems();
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image(
          height: 102,
          width: 102,
          image: AssetImage(Assets.imagesLogo),
        ),
        BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return SizedBox(
              width: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (drawerItems[index].routeName != AppRoutes.dashboar) {
                        Navigator.pushNamed(
                          context,
                          drawerItems[index].routeName,
                        );
                      }
                    },
                    child: DrawerItemWidget(
                      drawerItems[index],
                      isSelected: 1 == index,
                    )),
              ),
            );
          },
        )
      ],
    );
  }
}
