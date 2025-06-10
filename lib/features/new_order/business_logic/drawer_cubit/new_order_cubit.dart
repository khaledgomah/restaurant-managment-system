import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/core/data/repo/repo.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_strings.dart';
import 'package:restaurant_system/config/assets.dart';
import 'package:restaurant_system/config/di.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(NewOrderInitial(0, []));

  void addOne(SellingItem item) {
    var newSellingList = [...state.selling];
    for (var i = 0; i < newSellingList.length; i++) {
      if (newSellingList[i].item.name == item.item.name) {
        final updatedItem = newSellingList[i].copyWith(
          number: newSellingList[i].number + 1,
        );
        newSellingList.replaceRange(i, i + 1, [updatedItem]);

        emit(state.copyWith(selling: newSellingList));
        return;
      }
    }
  }

  double calcPrice() {
    double price = 0;
    for (var element in state.selling) {
      price += (element.number * element.item.ppu);
    }
    return price;
  }

  void subOne(SellingItem item) {
    var newSellingList = [...state.selling];
    for (var i = 0; i < newSellingList.length; i++) {
      if (newSellingList[i].item.name == item.item.name &&
          newSellingList[i].number > 0) {
        final updatedItem = newSellingList[i].copyWith(
          number: newSellingList[i].number - 1,
        );
        newSellingList.replaceRange(i, i + 1, [updatedItem]);

        emit(state.copyWith(selling: newSellingList));
        return;
      }
    }
  }

  void addToSellingList(SellingItem item) {
    if (state.selling.any((e) => e.item.name == item.item.name)) return;
    var newSellingList = [...state.selling];
    newSellingList.add(item);
    emit(state.copyWith(selling: newSellingList));
  }

  void deleteFromSellingList(SellingItem item) {
    var newSellingList = [...state.selling];

    for (var i = 0; i < state.selling.length; i++) {
      if (newSellingList[i].item.name == item.item.name) {
        newSellingList.removeAt(i);
        emit(state.copyWith(selling: newSellingList));

        return;
      }
    }
  }

  void deleteSelligList() {
    emit(state.copyWith(selling: List.from([])));
  }

  void update(int index) {
    if (state is NewOrderInitial &&
        (state as NewOrderInitial).selected == index) {
      return;
    }
    emit(state.copyWith(selected: index));
  }

  Future<List<ItemModel>> getItemsInCategorty() async {
    emit(NewOrderLoading(state.selected, state.selling));
    var response = await CoreRepository(instance()).getItemsData();
    response.fold(
      (l) => emit(NewOrderFailure(state.selected, l, state.selling)),
      (r) => emit(
        NewOrderSuccess(state.selected, r[_getCategory(state.selected)] ?? [],
            state.selling),
      ),
    );
    return [];
  }

  String _getCategory(int id) {
    switch (id) {
      case 0:
        return Categories.meals;
      case 1:
        return Categories.burgers;
      case 2:
        return Categories.sandwitchs;
      case 3:
        return Categories.sides;
      case 5:
        return Categories.drinks;
      default:
        return Categories.drinks;
    }
  }

  final List<DrawerItemModel> _drawerItems = [
    DrawerItemModel(
      routeName: '',
      title: 'Meals',
      iconPath: Assets.imagesMeal,
    ),
    DrawerItemModel(
      routeName: '',
      title: 'Burgers',
      iconPath: Assets.imagesBurger,
    ),
    DrawerItemModel(
      routeName: '',
      title: 'Sandwitchs',
      iconPath: Assets.imagesDeluxe,
    ),
    DrawerItemModel(
      routeName: '',
      title: 'Sides',
      iconPath: Assets.imagesIceCream,
    ),
    DrawerItemModel(
      routeName: '',
      title: 'Drinks',
      iconPath: Assets.imagesBigCola,
    ),
  ];

  List<DrawerItemModel> get drawerItems => _drawerItems;
}
