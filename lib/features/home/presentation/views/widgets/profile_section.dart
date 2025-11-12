import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.onTap,
    required this.assetPath,
    required this.title,
  });

  final VoidCallback onTap;
  final String assetPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            SvgPicture.asset(assetPath),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.hintTextColor,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Color(0xff0C0D0D)),
          ],
        ),
      ),
    );
  }
}
