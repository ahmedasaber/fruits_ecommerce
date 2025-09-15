import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.iconPath, required this.label});

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xffEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(child: SvgPicture.asset(iconPath)),
          ),
          SizedBox(width: 4,),
          Text(
            label,
            style: TextStyles.semiBold11.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(width: 8,),
        ],
      ),
    );
  }
}