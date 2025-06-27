import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class OrDivider extends StatelessWidget{
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0XFFDDDFDF),)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('أو', style: TextStyles.semiBold16,),
        ),
        const Expanded(child: Divider(color: Color(0XFFDDDFDF)))
      ],
    );
  }

}