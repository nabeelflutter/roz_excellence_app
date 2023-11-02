abstract class ForgetPasswordScreenStates{
  const ForgetPasswordScreenStates();
}
class ForgetPasswordScreenInitialState extends ForgetPasswordScreenStates{

}

class ForgetPasswordScreenLoadingState extends ForgetPasswordScreenStates{

}

class ForgetPasswordScreenLoadedState extends ForgetPasswordScreenStates{

}

class ForgetPasswordScreenErrorState extends ForgetPasswordScreenStates{
String error;

ForgetPasswordScreenErrorState({
    required this.error,
  });
}