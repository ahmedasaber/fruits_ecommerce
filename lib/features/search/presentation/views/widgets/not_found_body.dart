import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class NotFoundBody extends StatelessWidget {
  const NotFoundBody({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Image.asset('assets/images/search-image.png'),
        Text(localization.search, style: TextStyles.bold16),
        Text(
          localization.infoNotAvailable,
          style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
        ),
      ],
    );
  }
}
