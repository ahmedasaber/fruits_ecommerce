import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        uId: json['uId']
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity){
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uId: userEntity.uId
    );
  }

  toMap(){
    return{
      'name':name,
      'email': email,
      'uId': uId
    };
  }
}
