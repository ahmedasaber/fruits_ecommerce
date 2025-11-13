import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_password_textfireld.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_social_button.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_two_text.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/or_divider.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
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
                hintText: S.of(context).emailHint,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                hint: S.of(context).passwordHint,
                onSaved: (value){
                  password = value!;
                }
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).forgotPassword,
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              const SizedBox(height: 33,),
              CustomButton(
                text: S.of(context).login,
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(context,email.trim(), password.trim());
                  }else{
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }
              ),
              const SizedBox(height: 33,),
              Center(
                child: CustomTwoText(
                  text1: S.of(context).noAccount, text2: S.of(context).createAccount,
                  onTap: () => Navigator.pushNamed(context, SignUpView.routeName)
                )
              ),
              const SizedBox(height: 33,),
              const OrDivider(),
              const SizedBox(height: 24,),
              CustomSocialButton(onPressed: (){
                context.read<SignInCubit>().signInWithGoogle(context);
              }, title: S.of(context).signInWithGoogle, image: 'assets/images/google-icon.svg'),
              const SizedBox(height: 16),
              CustomSocialButton(onPressed: (){
                context.read<SignInCubit>().signInWithApple(context);
              }, title: S.of(context).signInWithApple, image: 'assets/images/apple-icon.svg'),
              const SizedBox(height: 16),
              CustomSocialButton(onPressed: (){
                context.read<SignInCubit>().signInWithFacebook(context);
              }, title: S.of(context).signInWithFacebook, image: 'assets/images/facebook-icon.svg'),
              const SizedBox(height: 33),
            ],
          ),
        ),
      ),
    );
  }
}
