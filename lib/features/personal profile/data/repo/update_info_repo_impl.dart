import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/features/personal%20profile/domain/repo/update_info_repo.dart';

class UpdateInfoRepoImpl extends UpdateInfoRepo{
  final FirebaseAuthService firebaseAuthService;

  UpdateInfoRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, void>> updateUserPassword({required String oldPassword, required String newPassword}) async{
    try {
      bool isCorrect = await firebaseAuthService.verifyPassword(enteredPassword: oldPassword);
      if (isCorrect) {
        await firebaseAuthService.updatePassword(newPassword: newPassword);
        return right(null);
      }else{
        return left(ServerFailure('كلمة المرور الحاليه غير صحيحه.'));
      }
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e){
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخرى. تاكد من كلمه المرور الحاليه.'));
    }
  }
}