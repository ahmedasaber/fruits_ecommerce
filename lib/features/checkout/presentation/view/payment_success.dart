import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/helper_function/get_current_localization.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import '../../../../core/utils/app_text_style.dart';

class PaymentSuccessPage extends StatelessWidget {
  static const routeName = '/success_page';
  final String orderId;

  const PaymentSuccessPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Directionality(
      textDirection: isArabic()? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCustomAppBar(
          context: context,
          title: localization.payment,
          showBackBt: false,
          showNotificationBt: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 67),
                SvgPicture.asset('assets/images/success.svg'),
                const SizedBox(height: 33),
                Text(localization.successfullyCompleted, style: TextStyles.bold16),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(
                    localization.orderNumberHash(orderId),
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.greyColor2,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomButton(
                    text: localization.home,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
