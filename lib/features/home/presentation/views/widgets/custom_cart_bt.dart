import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
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
        return CustomButton(
            text: 'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
            onPressed: (){}
        );
      },
    );
  }
}