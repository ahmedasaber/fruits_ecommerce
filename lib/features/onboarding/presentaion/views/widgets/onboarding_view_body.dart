import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/signIn_view.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/widgets/onboarding_page_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget{
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener((){
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(pageController: pageController,)
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 0 ? AppColors.primaryColor.withValues(alpha: 0.5) : AppColors.primaryColor
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Visibility(
          visible: currentPage == 1,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              text: S.of(context).startNow,
              onPressed: (){
                AppPrefs.setBool(kOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(context, SignInView.routeName);
              }
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    );
  }
}