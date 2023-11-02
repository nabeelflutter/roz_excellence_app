part of 'signin_with_google_bloc.dart';

@immutable
abstract class SocialSignInState {}

class SocialSignInInitial extends SocialSignInState {}
class SigninLoadingState extends SocialSignInState {}
class SigninLoadedState extends SocialSignInState {
  final user;
  SigninLoadedState(this.user);
}
class SigninErrorState extends SocialSignInState {
  String error;
  SigninErrorState({required this.error});
}
