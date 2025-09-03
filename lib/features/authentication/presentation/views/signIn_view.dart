import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/custom_app_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_progress_hud.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/signIn_view_body.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/main_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).login),
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if(state is SignInFailure) {
              buildErrorBar(context, state.message);
            }
            if(state is SignInSuccess) {
              Navigator.pushNamed(context, MainView.routeName);
            }
          },
          builder: (context, state) {
            return CustomProgressHUD(
              isLoading: state is SignInLoading? true : false,
              child: SignInViewBody(),
            );
          },
        ),
      ),
    );
  }
}