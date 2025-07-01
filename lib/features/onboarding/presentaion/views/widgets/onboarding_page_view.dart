import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/widgets/page_view_item.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: (pageController.hasClients? pageController.page!.round() : 0) == 0,
          image: 'assets/images/page-view-1-image.svg',
          backgroundImage: 'assets/images/page-view-1-back-image.svg',
          subTitle: S.of(context).onBoardingSubTitlePage1,
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: S.of(context).onBoardingTitleTextSpan1Page1,
                  style: TextStyles.bold23.copyWith(color: AppColors.blackColor)
                ),
                TextSpan(
                  text: S.of(context).onBoardingTitleTextSpan2Page1,
                  style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
                ),
                TextSpan(
                  text: S.of(context).onBoardingTitleTextSpan3Page1,
                  style: TextStyles.bold23.copyWith(color: AppColors.secondaryColor)
                ),
              ],
            ),
          ),
        ),
        PageViewItem(
          isVisible: (pageController.hasClients? pageController.page!.round() : 0) == 0,
          image: 'assets/images/page-view-2-image.svg',
          backgroundImage: 'assets/images/page-view-2-back-image.svg',
          subTitle:
              S.of(context).onBoardingSubTitlePage2,
          title: Text(
            S.of(context).onBoardingTitleTextPage2,
            style: TextStyles.bold23.copyWith(color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }
}
