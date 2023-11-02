import 'package:firebase_auth/firebase_auth.dart';

import '../../models/buyer.dart';

//first step of creating a bloc
abstract class SignUpScreenEvents{
  const SignUpScreenEvents();
}
//sign up with email and password
class SignUpWithEmailAndPassword extends SignUpScreenEvents{
  Buyer userObject;
  SignUpWithEmailAndPassword({required this.userObject});
}


// sign up with google
class SignUpWithGoogleEvent extends SignUpScreenEvents{

}
//sign up with facebook
class SignUpWithFacebookEvent extends SignUpScreenEvents{

}
//sign up with apple
class SignUpWithAppleEvent extends SignUpScreenEvents{

}

