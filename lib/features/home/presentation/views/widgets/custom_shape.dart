import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_feature_button.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({super.key, required this.onPressedBt});

  final VoidCallback onPressedBt;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RightCurveClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.moreLightPrimaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'عروض العيد',
              style: TextStyles.regular13.copyWith(color: Colors.white),
            ),
            Text(
              'خصم 25%',
              style: TextStyles.bold19.copyWith(color: Colors.white),
            ),
            CustomFeatureButton(onPressed: onPressedBt,),
          ],
        ),
      ),
    );
  }
}

class RightCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, 0);
    path.quadraticBezierTo(0, size.height * 0.5, size.width * 0.2, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
