import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/custom_app_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_progress_hud.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/singup_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context: context, title: S.of(context).newAccountTitleBar),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess){
              showErrorBar(context, S.of(context).success);
              Future.delayed(Duration(seconds: 2), () {
                if (context.mounted) {
                  Navigator.pop(context);
                }
              });
            }else if (state is SignupFailure){
              showErrorBar(context,state.message);
            }
          },
          builder: (context, state) {
            return CustomProgressHUD(
              isLoading: state is SignupLoading? true : false,
              child: SignUpViewBody())
            ;
          },
        ),
      ),
    );
  }
}