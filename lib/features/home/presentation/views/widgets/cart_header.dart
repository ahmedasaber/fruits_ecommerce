import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: AppColors.lightColor,
      child: Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.regular13.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
