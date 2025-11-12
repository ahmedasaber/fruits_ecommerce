import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, this.backgroundColor = AppColors.primaryColor, this.borderSideColor, this.textColor});

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? borderSideColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(
              color: borderSideColor?? Colors.transparent,
            )
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.bold16.copyWith(color: textColor ?? Colors.white),)
      ),
    );
  }
}
