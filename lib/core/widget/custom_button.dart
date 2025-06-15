import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w700),)
      ),
    );
  }
}
