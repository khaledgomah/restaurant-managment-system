import 'package:flutter/material.dart';
import 'package:restaurant_system/core/functions/get_drawer_items.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/core/custom_widgets/drawer_item_widget.dart';
import 'package:restaurant_system/config/assets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, this.routeName});
  final String? routeName;
  @override
  Widget build(BuildContext context) {
    final List<DrawerItemModel> drawerItems = getDrawerItems();
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
        SizedBox(
          width: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: drawerItems.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (drawerItems[index].routeName != routeName) {
                    Navigator.pushNamed(
                      context,
                      drawerItems[index].routeName,
                    );
                  }
                },
                child: DrawerItemWidget(
                  drawerItems[index],
                  isSelected: drawerItems[index].routeName == routeName,
                )),
          ),
        )
      ],
    );
  }
}
