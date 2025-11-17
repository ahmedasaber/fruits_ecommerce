import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/localization%20cubit/language_cubit.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_feature_button.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({super.key, required this.onPressedBt});

  final VoidCallback onPressedBt;
  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    Locale locale = context.read<LanguageCubit>().state;
    return ClipPath(
      clipper: RightCurveClipper(isRtl: locale == Locale('ar')),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.moreLightPrimaryColor,
          borderRadius: locale == Locale('ar')? BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ) : BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              localization.holidayOffers,
              style: TextStyles.regular13.copyWith(color: Colors.white),
            ),
            Text(
              localization.discount25,
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
  final bool isRtl;

  RightCurveClipper({required this.isRtl});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (isRtl) {
      // للّغة العربية (Right curve)
      path.moveTo(size.width * 0.2, 0);
      path.quadraticBezierTo(0, size.height * 0.5, size.width * 0.2, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      // للّغة الإنجليزية (Left curve)
      path.moveTo(size.width * 0.8, 0);
      path.quadraticBezierTo(size.width, size.height * 0.5, size.width * 0.8, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

