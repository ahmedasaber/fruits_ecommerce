import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/features/personal%20profile/domain/repo/update_info_repo.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class UpdateInfoRepoImpl extends UpdateInfoRepo{
  final FirebaseAuthService firebaseAuthService;

  UpdateInfoRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, void>> updateUserPassword({required BuildContext context ,required String oldPassword, required String newPassword}) async{
    var localization = S.of(context);
    try {
      bool isCorrect = await firebaseAuthService.verifyPassword(enteredPassword: oldPassword);
      if (isCorrect) {
        if(context.mounted) await firebaseAuthService.updatePassword(context: context, newPassword: newPassword);
        return right(null);
      }else{
        return left(ServerFailure(localization.currentPasswordIncorrect));
      }
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e){
      return left(ServerFailure(localization.errorCheckCurrentPassword));
    }
  }
}