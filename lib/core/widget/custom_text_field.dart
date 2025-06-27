import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget{
  const CustomTextFormField({super.key, required this.hintText, this.isPassword = false, required this.textInputType, this.suffixIcon});

  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.hintTextColor),
        suffixIcon: isPassword? suffixIcon: null,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder:  buildBorder(),
        focusedBorder:  buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
        color: Color(0xffE6E9EA),
        width: 1
    ),
  );
}