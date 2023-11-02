
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';

import '../login_or_signup_screen/login_or_sign_up_screen.dart';

mixin SplashScreenBehaviour{
  Future<void> navigateToTheOtherScreen(BuildContext context)async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) {
          if(FirebaseAuth.instance.currentUser==null){

          //  print('printing current user ${FirebaseAuth.instance.currentUser!.email}');

            return LoginOrSignUpScreen();
          }
          else {
          //  print('printing current user ${FirebaseAuth.instance.currentUser!.email}');

            return BottomNavigationScreen();
          }
      },));
    });
  }
}