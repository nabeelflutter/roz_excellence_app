import 'package:flutter/cupertino.dart';

mixin ForgetPasswordBehaviour {
  late TextEditingController emailController;






  void initStateLogin ( ){
    emailController = TextEditingController();

  }

  void disposeLogin(){
    emailController.dispose();

  }
}