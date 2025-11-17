import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/helper_function/show_logout_dialog.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/signIn_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key, required this.authRepo});

  final AuthRepo authRepo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showLogoutDialog(context);
        if (result == true) {
          await authRepo.logOut();
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInView.routeName,
            (r) => false,
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: AppColors.lightColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80),
              child: Text(
                S.of(context).logout,
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SvgPicture.asset('assets/images/logout.svg'),
          ],
        ),
      ),
    );
  }
}
