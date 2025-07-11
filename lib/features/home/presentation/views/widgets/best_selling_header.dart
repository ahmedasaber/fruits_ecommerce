import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/best_selling_fruits/presentaion/views/best_selling_fruits_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.bold16),
        Spacer(),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, BestSellingFruitsView.routeName);
          },
          child: Text('المزيد',
            style: TextStyles.regular13.copyWith(
              color: AppColors.hintTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
