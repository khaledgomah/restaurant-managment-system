// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_cubit.dart';
import 'package:restaurant_system/features/new_order/business_logic/drawer_cubit/new_order_state.dart';
import 'package:restaurant_system/config/app_colors.dart';
import 'package:restaurant_system/config/app_styles.dart';
import 'package:restaurant_system/config/assets.dart';

class NewOrderBodyBuilder extends StatelessWidget {
  const NewOrderBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewOrderCubit, NewOrderState>(
      builder: (context, state) {
        if (state is NewOrderFailure) {
          return Text('Sorry there was an error: ${state.failure.message}');
        } else if (state is NewOrderSuccess) {
          return NewOrderBody(
            list: state.items,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class NewOrderBody extends StatelessWidget {
  const NewOrderBody({super.key, required this.list});
  final List<ItemModel> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 35),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisExtent: 250,
              childAspectRatio: 161 / 250,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  BlocProvider.of<NewOrderCubit>(context).addToSellingList(
                      SellingItem(item: list[index], number: 1));
                },
                child: ProductWidget(item: list[index]));
          },
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: AppColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(item.imagePath ?? Assets.imagesRealBurger),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '\$${item.ppu.toString()}',
                style: AppStyles.medium16(),
              ),
            ),
            Text(
              item.name,
              style: AppStyles.bold16(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
