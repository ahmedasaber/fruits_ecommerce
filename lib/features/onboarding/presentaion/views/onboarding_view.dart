import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget{
  const OnBoardingView({super.key});
  static const routeName = "onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }

}