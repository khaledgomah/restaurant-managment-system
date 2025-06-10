// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class OrderNumber extends StatefulWidget {
  const OrderNumber({super.key, required this.item});
  final SellingItem item;
  @override
  State<OrderNumber> createState() => _OrderNumberState();
}

class _OrderNumberState extends State<OrderNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 72,
              width: 72,
              child: Image.asset(Assets.imagesRealBurger)),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 144,
            child: Column(
              children: [
                Text(
                  widget.item.item.name,
                  maxLines: 2,
                  style: AppStyles.medium14(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<NewOrderCubit>(context)
                            .addOne(widget.item);
                      },
                      icon: CustomIcon(icon: Assets.imagesAdd),
                    ),
                    Text(
                      widget.item.number.toString(),
                      style: AppStyles.medium14(),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<NewOrderCubit>(context)
                            .subOne(widget.item);
                      },
                      icon: CustomIcon(icon: Assets.imagesMinus),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.item.item.ppu}',
                style: AppStyles.bold14(),
              ),
              SizedBox(
                height: 60,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    BlocProvider.of<NewOrderCubit>(context)
                        .deleteFromSellingList(widget.item);
                  },
                  icon: SvgPicture.asset(Assets.imagesRemove))
            ],
          )
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: AppColors.primaryColor,
      child: SvgPicture.asset(icon),
    );
  }
}
