import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/get_current_localization.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/signIn_view.dart';
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
      crossAxisAlignment: isArabic()? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/Plant.svg'),
        Center(child: SvgPicture.asset('assets/images/logo.svg')),
        SvgPicture.asset('assets/images/Circles.svg'),
      ],
    );
  }

  void executeNavigate() {
    bool onBoardingViewSeen = AppPrefs.getBool(kOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3),(){
      if(onBoardingViewSeen){
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      }else{
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}