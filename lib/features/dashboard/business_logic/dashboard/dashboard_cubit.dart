import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/core/data/repo/repo.dart';
import 'package:restaurant_system/features/dashboard/data/models/dashboard_model.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/features/dashboard/data/models/sales_info_response.dart';
import 'package:restaurant_system/features/dashboard/data/models/total_widget_model.dart';
import 'package:restaurant_system/features/dashboard/data/repo/repo.dart';
import 'package:restaurant_system/config/assets.dart';
import 'package:restaurant_system/config/di.dart';
import 'package:restaurant_system/core/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial(10));
  late Map<String, List<ItemModel>> _itemModels;
  late List<TotalWidgetModel> _totalWidgetModels;
  late SalesInfoResponse _sales;
  int duration = 0;
  void showMoreItems() {
    final newCount = state.visibleCount + 10;
    emit(state.copyWith(visibleCount: newCount));
  }

  Future<void> getDashboardData(int duration) async {
    this.duration =
        duration; // to select the duration of the sales data showing
    emit(DashboardLoading(state.visibleCount));
    final salesResponse = await DashboardRepository(instance()).getSalesInfo();

    final itemsResponse = await CoreRepository(instance()).getItemsData();

    if (salesResponse.isLeft() || itemsResponse.isLeft()) {
      emit(DashboardFailure(
        state.visibleCount,
        salesResponse.fold((l) => l, (_) => null) ??
            itemsResponse.fold((l) => l, (_) => null)!,
      ));
      return;
    } else {
      itemsResponse.fold(
        (_) => null,
        (r) {
          _itemModels = r;
        },
      );
      salesResponse.fold(
        (_) => null,
        (r) {
          _sales = r;
        },
      );
    }
    _totalWidgetModels = [
      TotalWidgetModel(
          title: 'Total Revenue',
          value: _sales.totalRevenue.toString(),
          iconPath: Assets.imagesMoney),
      TotalWidgetModel(
          title: 'Total Orders',
          value: _sales.totalOrders.toString(),
          iconPath: Assets.imagesMenu),
      TotalWidgetModel(
          title: 'Walk-ins',
          value: _sales.walkIns.toString(),
          iconPath: Assets.imagesUsers),
      TotalWidgetModel(
          title: 'Online Orders',
          value: _sales.onlineOrders.toString(),
          iconPath: Assets.imagesOrder),
    ];

    emit(DashboardSuccess(
      state.visibleCount,
      dashboardModel: DashboardModel(
        items: _itemModels,
        totalWidgetModelsList: _totalWidgetModels,
      ),
    ));
  }

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
}
