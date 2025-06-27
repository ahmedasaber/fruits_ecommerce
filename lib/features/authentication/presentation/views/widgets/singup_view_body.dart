import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_two_text.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/term_and_conditions.dart';

class SignUpViewBody extends StatelessWidget{
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              isPassword: true,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: AppColors.hintTextColor,
              ),
            ),
            const SizedBox(height: 16),
            TermsAndConditions(),
            const SizedBox(height: 33,),
            CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {}
            ),
            const SizedBox(height: 26,),
            Center(
              child: CustomTwoText(
                  text1: 'تمتلك حساب بالفعل؟ ', text2: 'تسجيل دخول',
                  onTap: () => Navigator.pop(context)
              ),
            )
          ],
        ),
      ),
    );
  }
}