import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$count نتائح', style: TextStyles.bold16),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(4),
            border: Border.all(
              width: 1,
              color: Color(0xffCACECE),
            )
          ),
          child: SvgPicture.asset('assets/images/arrow-swap-horizontal.svg'),
        )
      ],
    );
  }
}
