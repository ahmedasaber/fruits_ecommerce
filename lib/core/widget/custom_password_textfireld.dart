import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';

class PasswordTextField extends StatefulWidget{
  const PasswordTextField({super.key, this.onSaved, required this.hint, this.controller});

  final void Function(String?)? onSaved;
  final String hint;
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      hintText: widget.hint,
      textInputType: TextInputType.visiblePassword,
      isObsecure: isNotVisible,
      suffixIcon: GestureDetector(
        onTap: (){
          isNotVisible = !isNotVisible;
          setState(() {});
        },
        child:
        isNotVisible
            ? Icon(
          Icons.remove_red_eye_rounded,
          color: AppColors.hintTextColor,
        )
            : Icon(
          Icons.visibility_off_rounded,
          color: AppColors.hintTextColor,
        ),
      ),
    );
  }
}