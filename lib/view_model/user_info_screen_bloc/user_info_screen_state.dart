abstract class UserInfoScreenStates{}

class UserInfoScreenLoadingState extends UserInfoScreenStates {}

class UserInfoScreenErrorState extends UserInfoScreenStates {
  String error;
  UserInfoScreenErrorState({required this.error});
}
class UserInfoScreenInitialState extends UserInfoScreenStates {}


class UserInfoScreenImageChangedState extends UserInfoScreenStates{
  String image;
  UserInfoScreenImageChangedState({required this.image});
}

class UserInfoScreenDetailLoadingState extends UserInfoScreenStates {}


class UserInfoScreenLoadedState extends UserInfoScreenStates {

  UserInfoScreenLoadedState();
}

class UserInfoScreenDatePickedStateState extends UserInfoScreenStates {
String date;
  UserInfoScreenDatePickedStateState({required this.date});
}