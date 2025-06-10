// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class NewOrderConfermHeader extends StatelessWidget {
  const NewOrderConfermHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'New',
              style: AppStyles.bold20(),
            ),
            Text(' Order', style: AppStyles.regular20()),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              BlocProvider.of<NewOrderCubit>(context).deleteSelligList();
            },
            icon: SvgPicture.asset(Assets.imagesDelete))
      ],
    );
  }
}
