import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/profile_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).myAccount,showBackBt: false, showNotificationBt: false),
      body: ProfileViewBody(authRepo: getIt<AuthRepo>(),),
    );
  }
}
