import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/notification_widget.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal:0),
      leading: Image.asset('assets/images/default-profile.png'),
      title: Text(
        S.of(context).goodMorning,
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        getUser().name,
        style: TextStyles.bold16.copyWith(color: AppColors.blackColor),
      ),
      trailing: NotificationWidget(),
    );
  }
}
