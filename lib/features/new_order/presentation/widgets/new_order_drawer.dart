import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/core/custom_widgets/drawer_item_widget.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class CustomNewOrderDrawer extends StatefulWidget {
  const CustomNewOrderDrawer({super.key});

  @override
  State<CustomNewOrderDrawer> createState() => _CustomNewOrderDrawerState();
}

class _CustomNewOrderDrawerState extends State<CustomNewOrderDrawer> {
  @override
  Widget build(BuildContext context) {
    final drawerItems = context.read<NewOrderCubit>().drawerItems;

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(Assets.imagesArrowLeft),
              ),
            ),
            Text(
              'Back',
              style: AppStyles.medium16(),
            )
          ],
        ),
        Image(
          height: 102,
          width: 102,
          image: AssetImage(Assets.imagesLogo),
        ),
        BlocBuilder<NewOrderCubit, NewOrderState>(
          builder: (context, state) {
            return SizedBox(
              width: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context, index) =>
                    BlocBuilder<NewOrderCubit, NewOrderState>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          BlocProvider.of<NewOrderCubit>(context).update(index);
                          BlocProvider.of<NewOrderCubit>(context)
                              .getItemsInCategorty();
                        },
                        child: DrawerItemWidget(
                          drawerItems[index],
                          isSelected: state.selected == index,
                        ));
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
