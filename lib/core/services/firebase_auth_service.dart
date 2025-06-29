import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      }else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تأكد من اتصالك بالإنترنت.');
      }else{
        throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
      }
    } catch (e) {
      logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
    }
  }

  Future<User> signInUsingEmailPassword({required String emailAddress, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w('$Exception in FirebaseAuthService.createAccountWithEmail: ${e.toString()} - code: ${e.code}');

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomExceptions(message: 'البريد الإلكتروني او كلمة مرور غير صحيح.');
      }else if (e.code == 'invalid-credential') {
        throw CustomExceptions(message: 'البريد الإلكتروني او كلمة مرور غير صحيحه. حاول مرة اخرى.');
      }else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تأكد من اتصالك بالإنترنت.');
      }else{
        throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
      }
    }catch (e) {
      logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ ما، حاول مرة أخري.');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}