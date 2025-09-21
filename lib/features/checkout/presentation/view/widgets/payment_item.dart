import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_decorations.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.bold13,),
        SizedBox(height: 8,),
        Container(
          decoration: AppDecorations.greyDecoration,
          child: child,
        )
      ],
    );
  }
}

