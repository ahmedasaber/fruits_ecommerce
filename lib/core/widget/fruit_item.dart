import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custon_network_image.dart';

import '../utils/app_colors.dart' show AppColors;

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 8),
      decoration: ShapeDecoration(
        color: Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: product.imageUrl != null
                    ? CustomNetworkImage(imageUrl: product.imageUrl!)
                    : Image.asset('assets/images/fruit-image.png', fit: BoxFit.cover,)
                )
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: TextStyles.semiBold13,),
                      SizedBox(height: 7,),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${product.price}جنية ',
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
          Stack(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite_border_outlined)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
