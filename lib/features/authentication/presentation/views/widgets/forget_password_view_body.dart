import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late TextEditingController controller;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            'لا تقلق ، ما عليك سوى كتابة بريدك الألكتروني وسنرسل لك رابط لاعاده تعين كلمة المرور.',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.greyColor2,
            ),
          ),
          SizedBox(height: 30),
          Form(
            key: _key,
            autovalidateMode: autovalidateMode,
            child: CustomTextFormField(
              controller: controller,
              hintText: S.of(context).emailHint,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 30),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if(state is ForgetPasswordFailure){
              showErrorBar(context, state.errMessage, backgroundColor: Colors.red);
            }else if(state is ForgetPasswordSuccess){
              showErrorBar(context, 'تم ارسال رابط الي بريدك الالكتروني لاعاده تعين كلمة المرور.', backgroundColor: Colors.green);
            }
          },
          builder: (context, state) {
            if(state is ForgetPasswordLoading){
              return Center(child: CircularProgressIndicator(),);
            }else {
              return CustomButton(text: 'نسيت كلمة المرور', onPressed: (){
                if(_key.currentState!.validate()){
                  _key.currentState!.save();
                  context.read<ForgetPasswordCubit>().resetPassword(controller.text.trim());
                }else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              });
            }
          },
        )
        ],
      ),
    );
  }
}
