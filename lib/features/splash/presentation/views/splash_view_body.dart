import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget{
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  
  @override
  void initState() {
    executeNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/Plant.svg'),
        Center(child: SvgPicture.asset('assets/images/logo.svg')),
        SvgPicture.asset('assets/images/Circles.svg'),
      ],
    );
  }

  void executeNavigate() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}