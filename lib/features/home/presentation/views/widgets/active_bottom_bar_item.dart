import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath);
  }
}