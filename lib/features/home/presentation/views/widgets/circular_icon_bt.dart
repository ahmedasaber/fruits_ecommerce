import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';

class CircularIconBt extends StatelessWidget {
  const CircularIconBt({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    this.backgroundColor = AppColors.primaryColor,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: IconButton(onPressed: onPressed, icon: icon, color: iconColor),
    );
  }
}
