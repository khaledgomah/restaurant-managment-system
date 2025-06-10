import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';
import 'package:restaurant_system/core/functions/on_generate_routes.dart';

class NewOrderConfirmFooter extends StatefulWidget {
  const NewOrderConfirmFooter({
    super.key,
  });

  @override
  State<NewOrderConfirmFooter> createState() => _NewOrderConfirmFooterState();
}

class _NewOrderConfirmFooterState extends State<NewOrderConfirmFooter> {
  double price = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<NewOrderCubit, NewOrderState>(
            builder: (context, state) {
              price = BlocProvider.of<NewOrderCubit>(context).calcPrice();
              return Text(
                '\$$price',
                style: AppStyles.bold16().copyWith(color: AppColors.white),
              );
            },
          ),
          Row(
            children: [
              Text(
                'Pay',
                style: AppStyles.regular16().copyWith(color: AppColors.white),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.checkout,
                        arguments: (price * 100).toInt(),);
                  },
                  icon: SvgPicture.asset(Assets.imagesRightArrow))
            ],
          ),
        ],
      ),
    );
  }
}
