import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/checkout_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart%20item/cart_item_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';

class CustomCartBt extends StatelessWidget {
  const CustomCartBt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        var cartItems = context.read<CartCubit>().cartEntity;
        return CustomButton(
            text: 'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice().toStringAsFixed(2)} جنيه',
            onPressed: (){
              if (cartItems.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutView.routeName, arguments: cartItems);
              }else{
                showErrorBar(context, 'لا توجد منتجات في السلة', backgroundColor: Colors.red, durationInSec: 1);
              }
            }
        );
      },
    );
  }
}