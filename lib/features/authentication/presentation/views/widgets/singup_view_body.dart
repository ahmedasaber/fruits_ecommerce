import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_password_textfireld.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_two_text.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/term_and_conditions.dart';

class SignUpViewBody extends StatefulWidget{
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String name, email, password;
  bool isAcceptTerms = false;
  bool isVisible = false;
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
                  name = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
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
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value){
                  isAcceptTerms = value;
                },
              ),
              const SizedBox(height: 33,),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    if (isAcceptTerms) {
                      context.read<SignupCubit>().createAccount(name, email, password);
                    }else{
                      buildErrorBar(context, 'يجب عليك الموافقة على شروط والأحكام');
                    }
                  }else{
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }
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
      ),
    );
  }
}