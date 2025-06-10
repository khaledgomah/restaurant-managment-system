import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_body_builder.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_confirm.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_drawer.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_colors.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  late List<DrawerItemModel> drawerItems;
  @override
  void initState() {
    BlocProvider.of<NewOrderCubit>(context).getItemsInCategorty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundcolor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 146,
            child: BlocBuilder<NewOrderCubit, NewOrderState>(
              builder: (context, state) {
                return CustomNewOrderDrawer();
              },
            ),
          ),
          SizedBox(
            width: 22,
          ),
          Expanded(
              flex: 509,
              child: BlocBuilder<NewOrderCubit, NewOrderState>(
                builder: (context, state) {
                  return NewOrderBodyBuilder();
                },
              )),
          SizedBox(
            width: 22,
          ),
          Expanded(flex: 309, child: NewOrderConfirm()),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
