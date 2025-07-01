import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/core/utils/backend_endpoints.dart';
import 'package:fruits_ecommerce/features/authentication/data/models/user_model.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:logger/logger.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.firebaseAuthService});

  var logger = Logger();
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required BuildContext context,required String name,required String email, required String password}) async{
   User? user;
    try {
      user =  await firebaseAuthService.createAccountWithEmail(context: context,emailAddress: email, password: password);
     var userEntity = UserEntity(name: name, email: email, uId: user.uid);
     await addUserData(user: userEntity);
     return right(userEntity);
   } on CustomExceptions catch (e) {
      await deleteUser(user: user);
     return left(ServerFailure(e.message));
   }catch (e){
      await deleteUser(user: user);
     logger.w('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
     return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
   }
  }

  @override
  Future<Either<Failure, UserEntity>> singInWithEmailAndPassword({required BuildContext context,required String email, required String password}) async{
    try {
      var user = await firebaseAuthService.signInUsingEmailPassword(context: context,emailAddress: email, password: password);
      var userEntity = await getUserData(docId: user.uid);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    }catch (e){
      logger.w('Exception in AuthRepoImpl.singInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> singInWithGoogle({required BuildContext context,}) async{
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle(context: context,);
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(path: BackEndEndPoints.getUserData, docId: user.uid);
      if(isUserExists){
        await getUserData(docId: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    }catch (e){
      await deleteUser(user: user);
      logger.w('Exception in AuthRepoImpl.singInWithGoogle: ${e.toString()}');
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> singInWithFacebook({required BuildContext context,}) async{
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook(context: context,);
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(path: BackEndEndPoints.getUserData, docId: user.uid);
      if(isUserExists){
        await getUserData(docId: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user: user);
      return left(ServerFailure(e.message));
    }catch (e){
      await deleteUser(user: user);
      logger.w('Exception in AuthRepoImpl.singInWithFacebook: ${e.toString()} code: ${e.runtimeType}');
      return left(ServerFailure('هناك خطأ ما، حاول مرة أخري.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async{
    await databaseService.addData(path: BackEndEndPoints.addUserData, data: user.toMap(), docId: user.uId);
  }

  Future deleteUser({required User? user}) async{
    if(user != null){
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String docId}) async{
    var user = await databaseService.getData(path: BackEndEndPoints.getUserData, docId: docId);
    return UserModel.fromJson(user);
  }
}