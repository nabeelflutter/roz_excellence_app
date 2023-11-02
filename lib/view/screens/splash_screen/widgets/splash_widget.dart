// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget SplashWidget() {
  return Center(
    child: Container(
        height: 200,
        width: 200,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ))),
  );
}
