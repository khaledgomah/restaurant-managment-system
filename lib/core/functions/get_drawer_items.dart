import 'package:restaurant_system/config/assets.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';

List<DrawerItemModel> getDrawerItems() {
    return [
      DrawerItemModel(
        routeName: AppRoutes.newOrder,
        title: 'New Order',
        iconPath: Assets.imagesMenu,
      ),
      DrawerItemModel(
        routeName: AppRoutes.dashboard,
        title: 'Dashboard',
        iconPath: Assets.imagesPieChart,
      ),
      DrawerItemModel(
        routeName: AppRoutes.onlineOrder,
        title: 'Online Order',
        iconPath: Assets.imagesOrder,
      ),
      DrawerItemModel(
        routeName: '',
        title: 'Settings',
        iconPath: Assets.imagesSettings,
      ),
      DrawerItemModel(
        routeName: '',
        title: 'Logout',
        iconPath: Assets.imagesLogIn,
      ),
    ];
  }