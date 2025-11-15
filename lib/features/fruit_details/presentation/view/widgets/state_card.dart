import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class StateCard extends StatelessWidget {
  const StateCard({
    super.key, required this.title, required this.subTitle, required this.iconPath,
  });
  final String title;
  final String subTitle;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightGreyColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title, style: TextStyles.bold16.copyWith(color: AppColors.lightPrimaryColor),),
              Text(subTitle, style: TextStyles.semiBold13.copyWith(color: AppColors.hintTextColor),),
            ],
          ),
          SizedBox(width: 16,),
          SvgPicture.asset(iconPath),
        ],
      ),
    );
  }
}
