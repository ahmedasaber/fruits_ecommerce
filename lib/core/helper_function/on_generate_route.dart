import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/onboarding_view.dart';
import 'package:fruits_ecommerce/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName: 
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}