import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class OrDivider extends StatelessWidget{
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0XFFDDDFDF),)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(S.of(context).orDivider, style: TextStyles.semiBold16,),
        ),
        const Expanded(child: Divider(color: Color(0XFFDDDFDF)))
      ],
    );
  }

}