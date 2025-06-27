import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/custom_app_bar.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/singup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'حساب جديد'),
      body: SignUpViewBody(),
    );
  }
}