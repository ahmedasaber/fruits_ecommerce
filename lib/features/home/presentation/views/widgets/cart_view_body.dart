import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
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
          CartItemsList(cartItems: [],),
          SliverToBoxAdapter(
            child: Divider(color: Color(0xffF1F1F5), height:10,),
          ),
          SliverToBoxAdapter(
            child:  Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                      text: 'الدفع  120جنيه',
                      onPressed: (){}
                  ),
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