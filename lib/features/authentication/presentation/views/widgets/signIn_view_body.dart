import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_password_textfireld.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_social_button.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_two_text.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/or_divider.dart';
import '../signup_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {

  late String email, password;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value){
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                onSaved: (value){
                  password = value!;
                }
              ),
              const SizedBox(height: 16),
              Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              const SizedBox(height: 33,),
              CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(email.trim(), password.trim());
                  }else{
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }
              ),
              const SizedBox(height: 33,),
              Center(
                child: CustomTwoText(
                  text1: ' لا تمتلك حساب؟', text2: 'قم بإنشاء حساب',
                  onTap: () => Navigator.pushNamed(context, SignUpView.routeName)
                )
              ),
              const SizedBox(height: 33,),
              const OrDivider(),
              const SizedBox(height: 24,),
              CustomSocialButton(onPressed: (){
                context.read<SignInCubit>().signInWithGoogle();
              }, title: 'تسجيل بواسطة جوجل', image: 'assets/images/google-icon.svg'),
              const SizedBox(height: 16),
              CustomSocialButton(onPressed: (){}, title: 'تسجيل بواسطة أبل', image: 'assets/images/apple-icon.svg'),
              const SizedBox(height: 16),
              CustomSocialButton(onPressed: (){}, title: 'تسجيل بواسطة فيسبوك', image: 'assets/images/facebook-icon.svg'),
              const SizedBox(height: 33),
            ],
          ),
        ),
      ),
    );
  }
}
