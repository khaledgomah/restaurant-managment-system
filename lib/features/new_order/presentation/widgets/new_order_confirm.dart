import 'package:flutter/material.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_conferm_header.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_confirm_body.dart';
import 'package:restaurant_system/features/new_order/presentation/widgets/new_order_confirm_footer.dart';
import 'package:restaurant_system/config/app_colors.dart';

class NewOrderConfirm extends StatelessWidget {
  const NewOrderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 34, horizontal: 10),
      color: AppColors.white,
      child: Column(
        children: [
          NewOrderConfermHeader(),
          NewOrderConfirmBody(),
          NewOrderConfirmFooter()
        ],
      ),
    );
  }
}
