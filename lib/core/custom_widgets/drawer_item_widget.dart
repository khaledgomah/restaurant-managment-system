import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_system/core/data/models/drawer_item_model.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget(this.item, {super.key, required this.isSelected});
  final DrawerItemModel item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            item.iconPath,
            colorFilter: isSelected
                ? const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  )
                : const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
          ),
          Text(
            item.title,
            style: AppStyles.regular12().copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
