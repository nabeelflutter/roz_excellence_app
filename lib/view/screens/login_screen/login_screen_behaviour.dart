import 'package:flutter/cupertino.dart';

class ProfileScreenBehaviour{
  TextEditingController firstNameController=TextEditingController();
  TextEditingController sureNameController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  TextEditingController passportController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();

  void dispose(){
    firstNameController.dispose();
    sureNameController.dispose();
    userNameController.dispose();
    countryController.dispose();
    passportController.dispose();
    phoneNumberController.dispose();
  }
}