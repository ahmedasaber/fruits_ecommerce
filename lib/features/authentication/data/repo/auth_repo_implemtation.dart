import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/features/authentication/data/models/user_model.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:logger/logger.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  var logger = Logger();
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String name,required String email, required String password}) async{
   try {
     var user =  await firebaseAuthService.createAccountWithEmail(emailAddress: email, password: password);
     return right(UserModel.fromFirebaseUser(user));
   } on CustomExceptions catch (e) {
     return left(ServerFailure(e.message));
   }catch (e){
     logger.w('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
     return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
   }
  }

  @override
  Future<Either<Failure, UserEntity>> singInWithEmailAndPassword({required String email, required String password}) async{
    try {
      var user = await firebaseAuthService.signInUsingEmailPassword(emailAddress: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    }catch (e){
      logger.w('Exception in AuthRepoImpl.singInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> singInWithGoogle() async{
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    }catch (e){
      logger.w('Exception in AuthRepoImpl.singInWithGoogle: ${e.toString()}');
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
    }
  }

}