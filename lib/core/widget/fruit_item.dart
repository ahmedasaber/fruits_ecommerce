import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

import '../utils/app_colors.dart' show AppColors;

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 8),
      decoration: ShapeDecoration(
        color: Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite_border_outlined)
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Image.asset('assets/images/fruit-image.png', fit: BoxFit.contain,),
                )
              ),
            ],
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('فراولة', style: TextStyles.semiBold13,),
                  SizedBox(height: 7,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30جنية ',
                          style: TextStyles.bold13.copyWith(color: AppColors.secondaryColor)
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: TextStyles.bold13.copyWith(color: AppColors.lightSecondaryColor)
                        ),
                      ]
                    )
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add), color: Colors.white,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
