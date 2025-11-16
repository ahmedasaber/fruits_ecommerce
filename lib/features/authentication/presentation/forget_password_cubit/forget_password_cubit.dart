import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  void resetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.sendPasswordResetEmail(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(errMessage: failure.message)),
      (_) => emit(ForgetPasswordSuccess()),
    );
  }
}
