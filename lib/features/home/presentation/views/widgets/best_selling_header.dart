import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/best_selling_fruits/presentaion/views/best_selling_fruits_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BestSellingFruitsView.routeName);
      },
      child: Row(
        children: [
          Text(localization.bestSelling, style: TextStyles.bold16),
          Spacer(),
          Text(localization.more,
            style: TextStyles.regular13.copyWith(
              color: AppColors.hintTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
