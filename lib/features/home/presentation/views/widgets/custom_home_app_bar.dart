import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal:0),
      leading: Image.asset('assets/images/default-profile.png'),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16.copyWith(color: AppColors.blackColor),
      ),
      trailing: Container(
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color:Color(0xffeef8ed),
          shape: OvalBorder()
        ),
        child: SvgPicture.asset('assets/images/notification.svg'),
      ),
    );
  }
}
