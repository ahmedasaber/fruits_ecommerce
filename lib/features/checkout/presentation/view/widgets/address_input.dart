import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';

class AddressInput extends StatefulWidget {
  const AddressInput({super.key});

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(hintText: 'الاسم كامل', textInputType: TextInputType.text),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: 'البريد الإلكتروني', textInputType: TextInputType.emailAddress),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: 'العنوان', textInputType: TextInputType.streetAddress),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: 'رقم الهاتف', textInputType: TextInputType.phone),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: 'المدينه', textInputType: TextInputType.text),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: 'رقم الطابق , رقم الشقه ..', textInputType: TextInputType.streetAddress),
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch.adaptive(
                      value: false,
                      onChanged: (bool value) {  },
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Text('حفظ العنوان', style: TextStyles.semiBold13.copyWith(color: AppColors.hintTextColor,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
