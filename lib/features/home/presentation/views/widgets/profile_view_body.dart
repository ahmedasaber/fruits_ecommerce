import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/localization%20cubit/language_cubit.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/core/widget/log_out_button.dart';
import 'package:fruits_ecommerce/features/about/presentation/views/about_view.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/profile_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/profile_section.dart';
import 'package:fruits_ecommerce/features/my%20orders/presentaion/views/my_order_view.dart';
import 'package:fruits_ecommerce/features/personal%20profile/presentation/views/personal_profile_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.authRepo});
  final AuthRepo authRepo;
  @override
  Widget build(BuildContext context) {
    final UserEntity user = getUser();
    var localization = S.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(user: user),
                const SizedBox(height: 24,),
                Text(localization.general, style: TextStyles.semiBold13,),
                const SizedBox(height: 16,),
                Section(onTap: () {
                  Navigator.pushNamed(context, PersonalProfileView.routeName);
                }, assetPath: 'assets/images/profile-green.svg', title: localization.personalProfile,),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {
                  Navigator.pushNamed(context, MyOrdersView.routeName);
                }, assetPath: 'assets/images/box.svg', title: localization.myOrders,),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/empty-wallet.svg', title: localization.payments,),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/heart-fav.svg', title: localization.favorites,),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/notification.svg', title: localization.notifications,),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {
                  buildChangeLanguageDialog(context);
                }, assetPath: 'assets/images/global.svg', title: localization.language,),
                Divider(color: Color(0xfff2f3f3),),
                const SizedBox(height: 16,),
                Text(localization.help, style: TextStyles.semiBold13,),
                const SizedBox(height: 16,),
                Section(onTap: () {
                  Navigator.pushNamed(context, AboutView.routeName);
                }, assetPath: 'assets/images/info-circle.svg', title: localization.aboutUs,),
                Divider(color: Color(0xfff2f3f3),),
                const SizedBox(height: 63,),
              ],
            ),
          ),
          LogOutButton(authRepo: authRepo),
          const SizedBox(height: 63,),
        ],
      ),
    );
  }
}

Future<bool?> buildChangeLanguageDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).chooseLanguage,
                textAlign: TextAlign.center,
                style: TextStyles.bold16,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'العربية',
                      onPressed: () => context.read<LanguageCubit>().changeToArabic(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomButton(
                      text: 'English',
                      onPressed: () => context.read<LanguageCubit>().changeToEnglish(),
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
      );
    },
  );
}