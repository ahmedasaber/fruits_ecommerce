import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/widget/notification_view.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NotificationView.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
            color:Color(0xffeef8ed),
            shape: OvalBorder()
        ),
        child: SvgPicture.asset('assets/images/notification.svg'),
      ),
    );
  }
}