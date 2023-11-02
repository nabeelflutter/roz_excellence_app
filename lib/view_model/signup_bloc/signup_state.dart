//second step of creating a bloc for some screen
abstract class SignUpScreenStates{
  const SignUpScreenStates();
}
class SignUpScreenInitialState extends SignUpScreenStates{

}

class SignUpScreenLoadingState extends SignUpScreenStates{

}

class SignUpScreenLoadedState extends SignUpScreenStates{

}


class SignUpScreenErrorState extends SignUpScreenStates{
  String error;
  SignUpScreenErrorState({required this.error});
}
