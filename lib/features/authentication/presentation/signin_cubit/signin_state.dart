part of 'signin_cubit.dart';

@immutable
sealed class SignInState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}
final class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
