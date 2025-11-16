import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_password_textfireld.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/personal%20profile/presentation/cubit/update_user_info_cubit.dart';

class PersonalProfileViewBody extends StatefulWidget {
  const PersonalProfileViewBody({super.key});

  @override
  State<PersonalProfileViewBody> createState() => _PersonalProfileViewBodyState();
}

class _PersonalProfileViewBodyState extends State<PersonalProfileViewBody> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = getUser();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(hintText: userEntity.name, textInputType: TextInputType.name, onSaved: (value){},),
            SizedBox(height: 8,),
            CustomTextFormField(hintText: userEntity.email, textInputType: TextInputType.emailAddress,onSaved: (value){}),
            SizedBox(height: 16,),
            Text('تغيير كلمة المرور', style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Form(
              key: _key,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  PasswordTextField(controller: currentPasswordController, hint: 'كلمة المرور الحالي', ),
                  SizedBox(height: 8,),
                  PasswordTextField(controller: newPasswordController, hint: 'كلمة المرور الجديده', ),
                  SizedBox(height: 8,),
                  PasswordTextField(controller: confirmPasswordController, hint: 'تأكيد كلمة المرور الجديده', ),
                  SizedBox(height: 74,),
                  BlocConsumer<UpdateUserInfoCubit, UpdateUserInfoState>(
                    listener: (context, state) {
                      if(state is UpdateUserInfoFailure){
                        showErrorBar(context, state.errMessage, backgroundColor: Colors.red);
                      }else if(state is UpdateUserInfoSuccess){
                        showErrorBar(context, 'تم تغير كلمة المرور بنجاح.', backgroundColor: Colors.green);
                        currentPasswordController.clear();
                        newPasswordController.clear();
                        confirmPasswordController.clear();
                      }
                    },
                    builder: (context, state) {
                      if(state is UpdateUserInfoLoading) {
                        return Center(child: CircularProgressIndicator(),);
                      } else {
                        return CustomButton(text: 'حفظ التغييرات', onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          if (newPasswordController.text.trim() ==
                              confirmPasswordController.text.trim()) {
                              context.read<UpdateUserInfoCubit>().updateUserPassword(oldPassword: currentPasswordController.text.trim(), newPassword: newPasswordController.text.trim());
                          } else {
                            showErrorBar(context, 'تأكيد كلمة المرور الجديده غير صحيح ', backgroundColor: Colors.red);
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
