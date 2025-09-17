import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.label, required this.index});

  final String label;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.lightGreyColor,
          child: Text(index.toString(), style: TextStyles.semiBold13)
        ),
        SizedBox(width: 4,),
        Text(label, style: TextStyles.bold13.copyWith(color: AppColors.greyColor),)
      ],
    );
  }
}
