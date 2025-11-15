import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Text('المراجعه', style: TextStyles.bold13.copyWith(
        color: AppColors.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryColor,
        decorationThickness: 2.0,
        decorationStyle: TextDecorationStyle.solid,)),
    );
  }
}
