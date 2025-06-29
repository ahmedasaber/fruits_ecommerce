import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/generated/intl/messages_ar.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async{
    emit(SignInLoading());
    var result = await authRepo.singInWithEmailAndPassword(email: email, password: password);
    result.fold(
      (failure)=> emit(SignInFailure(message: failure.message)),
      (userEntity)=> emit(SignInSuccess(userEntity: userEntity)),
    );
  }
  Future<void> signInWithGoogle() async{
    emit(SignInLoading());
    var result = await authRepo.singInWithGoogle();
    result.fold(
      (failure)=> emit(SignInFailure(message: failure.message)),
      (userEntity)=> emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
