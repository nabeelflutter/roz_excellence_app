import 'package:firebase_auth/firebase_auth.dart';

class LoginScreenEvents{
  const LoginScreenEvents();
}
class LoginEvent extends LoginScreenEvents{
  String email;
  String password;

  LoginEvent({required this.email,required this.password});

}




class LoginWithGoogleEvent extends LoginScreenEvents{

}

class LoginWithFacebookEvent extends LoginScreenEvents{

}

class LoginWithAppleEvent extends LoginScreenEvents{

}



