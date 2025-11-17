import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/forget_password_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = '/forget_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).forgotPassword, showNotificationBt: false),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
        child: ForgetPasswordViewBody(),
      ),
    );
  }
}
