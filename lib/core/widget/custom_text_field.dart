import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget{
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isObsecure = false,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.readOnly = false,
    this.controller,
  });

  final TextEditingController? controller;
  final String hintText;
  final TextInputType textInputType;
  final bool isObsecure;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      readOnly: readOnly,
      validator: (value){
        if(value == null || value.isEmpty){
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.hintTextColor),
        suffixIcon: suffixIcon,
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