import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/notification_widget.dart';

AppBar buildCustomAppBar({ required BuildContext context, required String title, bool showBackBt = true, bool showNotificationBt = true}) {
  return AppBar(
    actions: [
      Visibility(
        visible: showNotificationBt,
          child: NotificationWidget()
      )
    ],
      leading: Visibility(
        visible: showBackBt,
        child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      )
  );
}