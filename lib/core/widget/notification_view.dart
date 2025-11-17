import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: localization.notifications, showNotificationBt: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/notification-image.png'),
              const SizedBox(height: 28),
              Text(localization.nothingToShow,
                textAlign: TextAlign.center,
                style: TextStyles.bold23
              ),
              const SizedBox(height: 8),
              Text(localization.willNotifyYou,
                textAlign: TextAlign.center,
                style: TextStyles.semiBold16.copyWith(color: AppColors.greyColor2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
