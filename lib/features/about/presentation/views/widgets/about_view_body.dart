import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localization.aboutText1,style: TextStyles.semiBold13),
            Text(localization.aboutText2,style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text(localization.aboutText3,style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text(localization.aboutText4,style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text(localization.aboutText5,style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text(localization.aboutText6,style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Center(child: Text(localization.developer,style: TextStyles.semiBold13.copyWith(color: Colors.red),)),
          ],
        ),
      ),
    );
  }
}
