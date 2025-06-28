import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService{
  var logger = Logger();
  Future<User> createAccountWithEmail({required String emailAddress, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w('$Exception in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');

      if (e.code == 'weak-password') {
       throw CustomExceptions(message: 'كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      }else{
        throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
      }
    } catch (e) {
      logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
    }
  }
}