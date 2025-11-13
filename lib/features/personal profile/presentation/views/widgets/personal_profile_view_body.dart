import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_password_textfireld.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';

class PersonalProfileViewBody extends StatelessWidget {
  const PersonalProfileViewBody({super.key});

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
            PasswordTextField(onSaved: (value){}, hint: 'كلمة المرور الحالي', ),
            SizedBox(height: 8,),
            PasswordTextField(onSaved: (value){}, hint: 'كلمة المرور الجديده', ),
            SizedBox(height: 8,),
            PasswordTextField(onSaved: (value){}, hint: 'تأكيد كلمة المرور الجديده', ),
            SizedBox(height: 74,),
            CustomButton(text: 'حفظ التغييرات', onPressed: (){}),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
