import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/personal%20profile/domain/repo/update_info_repo.dart';
import 'package:meta/meta.dart';

part 'update_user_info_state.dart';

class UpdateUserInfoCubit extends Cubit<UpdateUserInfoState> {
  UpdateUserInfoCubit({required this.updateInfoRepo}) : super(UpdateUserInfoInitial());

  final UpdateInfoRepo updateInfoRepo;

  void updateUserPassword({required BuildContext context ,required String oldPassword, required String newPassword}) async{
    emit(UpdateUserInfoLoading());
    var result = await updateInfoRepo.updateUserPassword(context: context, oldPassword: oldPassword, newPassword: newPassword);
    result.fold(
      (failure) => emit(UpdateUserInfoFailure(errMessage: failure.message)),
      (_) => emit(UpdateUserInfoSuccess()),
    );
  }
}
