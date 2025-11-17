import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

Future<bool?> showLogoutDialog(BuildContext context) {
  var localization = S.of(context);
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    localization.logoutConfirmation,
                    textAlign: TextAlign.center,
                    style: TextStyles.bold16,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: localization.confirm,
                          onPressed: () => Navigator.pop(context, true),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomButton(
                          text: localization.doNotWant,
                          onPressed: () => Navigator.pop(context, false),
                          backgroundColor: Colors.white,
                          borderSideColor: AppColors.primaryColor,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      );
    },
  );
}