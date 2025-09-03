import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/signIn_view.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/signup_view.dart';
import 'package:fruits_ecommerce/features/best_selling_fruits/presentaion/views/best_selling_fruits_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/main_view.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/onboarding_view.dart';
import 'package:fruits_ecommerce/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName: 
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingFruitsView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingFruitsView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}