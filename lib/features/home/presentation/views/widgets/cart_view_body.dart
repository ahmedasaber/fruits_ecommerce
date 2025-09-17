import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/cart_items_list.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_cart_bt.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItemEntity> cartList = context.watch<CartCubit>().cartEntity.cartItems;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildCustomAppBar(
                  context: context,
                  title: 'السلة',
                  showNotificationBt: false,
                  showBackBt: false,
                ),
                SizedBox(height: 16),
                CartHeader(),
                SizedBox(height: 16),
              ],
            ),
          ),
          CartItemsList(cartItems: cartList,),
          SliverToBoxAdapter(
            child: cartList.isNotEmpty
              ? Divider(color: Color(0xffF1F1F5), height: 10)
              : SizedBox(),
          ),
          SliverToBoxAdapter(
            child:  Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomCartBt(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height *0.07,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}