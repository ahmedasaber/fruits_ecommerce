import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';

abstract class AppDecorations{
  static var greyDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: AppColors.backgroundGreyColor,
  );
}