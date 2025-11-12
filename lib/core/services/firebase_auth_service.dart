import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_ecommerce/core/errors/exceptions.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService{
  var logger = Logger();

  Future<User> createAccountWithEmail({required BuildContext context, required String emailAddress, required String password}) async{
    final weakPasswordMsg = S.of(context).weakPassword;
    final emailInUseMsg = S.of(context).emailAlreadyInUse;
    final networkErrorMsg = S.of(context).networkError;
    final genericErrorMsg = S.of(context).genericError;

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w('$Exception in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');

      if (e.code == 'weak-password') {
       throw CustomExceptions(message: weakPasswordMsg);
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: emailInUseMsg);
      }else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: networkErrorMsg);
      }else{
        throw CustomExceptions(message: genericErrorMsg);
      }
    } catch (e) {
      logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
      throw CustomExceptions(message: genericErrorMsg);
    }
  }

  Future<User> signInUsingEmailPassword({required BuildContext context,required String emailAddress, required String password}) async{

    final invalidCredentialMsg = S.of(context).invalidCredential;
    final invalidEmailOrPasswordMsg = S.of(context).invalidEmailOrPassword;
    final networkErrorMsg = S.of(context).networkError;
    final genericErrorMsg = S.of(context).genericError;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w('$Exception in FirebaseAuthService.createAccountWithEmail: ${e.toString()} - code: ${e.code}');

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomExceptions(message: invalidEmailOrPasswordMsg);
      }else if (e.code == 'invalid-credential') {
        throw CustomExceptions(message: invalidCredentialMsg);
      }else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: networkErrorMsg);
      }else{
        throw CustomExceptions(message: genericErrorMsg);
      }
    }catch (e) {
      logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
      throw CustomExceptions(message: genericErrorMsg);
    }
  }

  Future<User> signInWithGoogle({required BuildContext context}) async {
    final genericErrorMsg = S.of(context).genericError;
    try{
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
    }catch (e){
      logger.w('Google Sign-In error: ${e.toString()}');
      throw CustomExceptions(message: genericErrorMsg);
    }
  }

  Future<User> signInWithFacebook({required BuildContext context}) async {
    final facebookAccountExistsDifferentCredentialMsg = S.of(context).facebookAccountExistsDifferentCredential;
    final facebookLoginErrorMsg = S.of(context).facebookLoginError;

   try{
     // Trigger the sign-in flow
     final LoginResult loginResult = await FacebookAuth.instance.login();

     // Create a credential from the access token
     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

     // Once signed in, return the UserCredential
     return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
   } on FirebaseAuthException catch(e){
       logger.w('$Exception in FirebaseAuthService.createAccountWithEmail: ${e.toString()} - code: ${e.code}');
       if(e.code == 'account-exists-with-different-credential'){
         throw CustomExceptions(message: facebookAccountExistsDifferentCredentialMsg);
       }
       throw CustomExceptions(message: facebookLoginErrorMsg);
   }catch (e){
       logger.w('mException in FirebaseAuthService.createAccountWithEmail: ${e.toString()}');
       throw CustomExceptions(message: facebookLoginErrorMsg);
   }
  }
  Future deleteUser()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggIn(){
    return FirebaseAuth.instance.currentUser != null;
  }

  void logOut(){
    FirebaseAuth.instance.signOut();
  }
}