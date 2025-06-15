import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/core/helper_function/get_current_localization.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/onboarding/presentaion/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      //reverse: isArabic() ? true : false,
      children: [
        PageViewItem(
          isVisible: (pageController.hasClients? pageController.page!.round() : 0) == 0,
          image: 'assets/images/page-view-1-image.svg',
          backgroundImage: 'assets/images/page-view-1-back-image.svg',
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: 'مرحبًا بك في ',
                  style: TextStyles.bold23.copyWith(color: AppColors.blackColor)
                ),
                TextSpan(
                  text: 'Fruit',
                  style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
                ),
                TextSpan(
                  text: 'HUB',
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
              'قدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            'ابحث وتسوق',
            style: TextStyles.bold23.copyWith(color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }
}
