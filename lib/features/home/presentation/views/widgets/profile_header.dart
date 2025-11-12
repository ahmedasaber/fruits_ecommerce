import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';


class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(35),
              child: Image.asset('assets/images/profile-photo.png', height: 70, width: 70,fit: BoxFit.cover,),
            ),
            Positioned(
              left: 20,
              bottom: -16,
              child: Container(
                height: 32,
                width: 32,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xfff9f9f9),
                    borderRadius: BorderRadiusGeometry.circular(16),
                    border: Border.all(
                      color: Colors.white,
                    )
                ),
                child: SvgPicture.asset('assets/images/Camera.svg'),
              ),
            )
          ],
        ),
        SizedBox(width: 24,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name, style: TextStyles.bold13,),
            Text(user.email, style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),)
          ],
        ),
      ],
    );
  }
}
