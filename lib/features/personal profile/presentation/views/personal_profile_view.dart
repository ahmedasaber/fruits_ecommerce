import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/personal%20profile/domain/repo/update_info_repo.dart';
import 'package:fruits_ecommerce/features/personal%20profile/presentation/cubit/update_user_info_cubit.dart';
import 'package:fruits_ecommerce/features/personal%20profile/presentation/views/widgets/personal_profile_view_body.dart';

class PersonalProfileView extends StatelessWidget {
  const PersonalProfileView({super.key});

  static const routeName = '/personal_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context, title: 'الملف الشخصي', showNotificationBt: false),
      body: BlocProvider(
        create: (context) => UpdateUserInfoCubit(updateInfoRepo: getIt<UpdateInfoRepo>()),
        child: PersonalProfileViewBody(),
      ),
    );
  }
}
