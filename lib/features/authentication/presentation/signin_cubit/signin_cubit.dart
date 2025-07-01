import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(BuildContext context,String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.singInWithEmailAndPassword(
      context: context,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle(BuildContext context,) async {
    emit(SignInLoading());
    var result = await authRepo.singInWithGoogle(context: context,);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithFacebook(BuildContext context,) async {
    emit(SignInLoading());
    var result = await authRepo.singInWithFacebook(context: context,);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
  
  Future<void> signInWithApple(BuildContext context) async {
    emit(SignInFailure(message: S.of(context).appleSignInNotDeveloped));
  }
  
  
}
