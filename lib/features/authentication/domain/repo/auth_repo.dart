import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required BuildContext context,required String name ,required String email, required String password});
  Future<Either<Failure, UserEntity>> singInWithEmailAndPassword({required BuildContext context,required String email, required String password});
  Future<Either<Failure, UserEntity>> singInWithGoogle({required BuildContext context,});
  Future<Either<Failure, UserEntity>> singInWithFacebook({required BuildContext context,});
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String docId});

}