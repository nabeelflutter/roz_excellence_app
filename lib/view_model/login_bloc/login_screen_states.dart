abstract class LoginScreenStates{
  const LoginScreenStates();
}
class LoginScreenInitialState extends LoginScreenStates{

}

class LoginScreenLoadingState extends LoginScreenStates{

}

class LoginScreenLoadedState extends LoginScreenStates{

}

class LoginScreenErrorState extends LoginScreenStates{
  String error;
  LoginScreenErrorState({required this.error});
}

//otpppppppppppppppp
class PhoneAuthCodeSentSuccess extends LoginScreenStates{
  final String verificationId;
  const PhoneAuthCodeSentSuccess({required this.verificationId});
}

class SignUpScreenOtpSuccessState extends LoginScreenStates{

}