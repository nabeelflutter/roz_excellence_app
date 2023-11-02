import 'package:flutter/cupertino.dart';

mixin RegisterBehaviour{



  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController dbController;





  void initStateRegister ( ){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dbController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
  }

  void disposeRegister(){
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    dbController.dispose();
    surnameController.dispose();
  }



}