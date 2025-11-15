import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';

import 'widgets/fruit_details_view_body.dart';

class FruitDetailsView extends StatelessWidget {
  const FruitDetailsView({super.key, required this.productEntity});

  static const routeName = '/fruit_details';
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        leadingWidth: 72,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: BlocProvider.value(
        value: getIt<CartCubit>(),
        child: FruitDetailsViewBody(productEntity: productEntity),
      ),
    );
  }
}
