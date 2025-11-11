import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class NotFoundBody extends StatelessWidget {
  const NotFoundBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Image.asset('assets/images/search-image.png'),
        Text('البحث', style: TextStyles.bold16),
        Text(
          'عفوًا... هذه المعلومات غير متوفرة للحظة',
          style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
        ),
      ],
    );
  }
}
