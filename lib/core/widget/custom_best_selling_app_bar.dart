import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/notification_widget.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text('الأكثر مبيعًا', style: TextStyles.bold19),
    centerTitle: true,
    actions: [
      NotificationWidget(),
      SizedBox(width: 16)
    ],
  );
}