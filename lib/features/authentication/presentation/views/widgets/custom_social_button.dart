import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.image,
  });

  final VoidCallback onPressed;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0XFFDDDFDF), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity // reduce height of list tile
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            style: TextStyles.semiBold16,
            textAlign: TextAlign.center,
          ),
        )),
    );
  }
}
