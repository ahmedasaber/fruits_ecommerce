import 'dart:convert';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/features/authentication/data/models/user_model.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';

UserEntity getUser(){
  var jsonString = AppPrefs.getString(kUserData);
  var userEntity =  UserModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  return userEntity;
}