import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';

class PasswordTextField extends StatefulWidget{
  const PasswordTextField({super.key, required this.onSaved, required this.hint});

  final void Function(String?)? onSaved;
  final String hint;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
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