import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/custom_app_bar.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/singup_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).newAccountTitleBar),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess){
              //Center(child: CircularProgressIndicator());
              buildErrorBar(context,state.userEntity.email);
            }else if (state is SignupFailure){
              buildErrorBar(context,state.message);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignupLoading? true : false,
              opacity: 0,
              // offset: Offset((MediaQuery.of(context).size.width / 2) - kHorizontalPadding, (MediaQuery.of(context).size.height / 2) - kToolbarHeight - kTextTabBarHeight),
              child: SignUpViewBody())
            ;
          },
        ),
      ),
    );
  }
}