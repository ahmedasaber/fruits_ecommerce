import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new)
      ),
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      )
  );
}