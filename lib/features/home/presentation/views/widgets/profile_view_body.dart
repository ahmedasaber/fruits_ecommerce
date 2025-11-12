import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/log_out_button.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/profile_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/profile_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.authRepo});
  final AuthRepo authRepo;
  @override
  Widget build(BuildContext context) {
    final UserEntity user = getUser();
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
                Text('عام', style: TextStyles.semiBold13,),
                const SizedBox(height: 16,),
                Section(onTap: () {  }, assetPath: 'assets/images/profile-green.svg', title: 'الملف الشخصي',),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/box.svg', title: 'طلباتي',),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/empty-wallet.svg', title: 'المدفوعات',),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/heart-fav.svg', title: 'المفضلة',),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/notification.svg', title: 'الاشعارات',),
                Divider(color: Color(0xfff2f3f3),),
                Section(onTap: () {  }, assetPath: 'assets/images/global.svg', title: 'اللغة',),
                Divider(color: Color(0xfff2f3f3),),
                const SizedBox(height: 16,),
                Text('المساعده', style: TextStyles.semiBold13,),
                const SizedBox(height: 16,),
                Section(onTap: () {  }, assetPath: 'assets/images/info-circle.svg', title: 'من نحن',),
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
