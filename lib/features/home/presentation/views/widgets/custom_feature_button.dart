import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class CustomFeatureButton extends StatelessWidget {
  const CustomFeatureButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(S.of(context).shopNow),
    );
  }
}
