import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/login_view.dart';

import '../../../../../core/helper_function/get_current_localization.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: (){
                    AppPrefs.setBool(kOnBoardingViewSeen, true);
                    Navigator.pushReplacementNamed(context, LoginView.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 45,
                      right: isArabic() ? 20 : 0,
                      left: isArabic() ? 0 : 20,
                    ),
                    child: Text(
                      "تخط",
                      style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff4E5456))
          ),
        ),
      ],
    );
  }
}
