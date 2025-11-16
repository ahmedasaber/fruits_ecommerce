import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';

abstract class UpdateInfoRepo{
  Future<Either<Failure, void>> updateUserPassword({required String oldPassword,required String newPassword});
}