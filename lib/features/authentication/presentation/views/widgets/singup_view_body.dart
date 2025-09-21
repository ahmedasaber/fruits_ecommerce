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
import 'package:fruits_ecommerce/generated/l10n.dart';

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
                hintText: S.of(context).fullNameHint,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  email = value!;
                },
                hintText: S.of(context).emailHint,
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
                text: S.of(context).newAccountButton,
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    if (isAcceptTerms) {
                      context.read<SignupCubit>().createAccount(context,name.trim(), email.trim(), password.trim());
                    }else{
                      showErrorBar(context, S.of(context).mustAcceptTerms);
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
                    text1: S.of(context).alreadyHaveAccount, text2: S.of(context).login,
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