import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String name ,required String email, required String password});
}