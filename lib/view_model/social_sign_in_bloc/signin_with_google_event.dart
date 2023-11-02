part of 'signin_with_google_bloc.dart';

@immutable
abstract class SocialSignInEvent {}
class SignInWithGoogleClickEvent extends SocialSignInEvent{}
 class SignInWithFaceBookClickEvent extends SocialSignInEvent{}

