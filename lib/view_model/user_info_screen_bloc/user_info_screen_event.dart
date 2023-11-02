import 'dart:io';
abstract class UserInfoScreenEvents {}
class UserInfoScreenPickImageEvent extends UserInfoScreenEvents{
  File image;
  UserInfoScreenPickImageEvent({required this.image});
}

class UserInfoScreenUpdateDetailsEvent extends UserInfoScreenEvents{
  String? dateOfBirth;
  String? fullName;
  String? phoneOrEmail;

  UserInfoScreenUpdateDetailsEvent({this.dateOfBirth,this.fullName,required this.phoneOrEmail});
}

class UserInfoScreenDatePickedEvent extends UserInfoScreenEvents{
  DateTime date;
  UserInfoScreenDatePickedEvent({required this.date});
}