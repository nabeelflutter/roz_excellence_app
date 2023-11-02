import 'package:flutter/material.dart';

mixin DetailBehaviour {
  int currentIndex = 0;
  late PageController controller;

  void initStateDetail() {
    controller = PageController();
  }

  void disposeDetail() {
    controller.dispose();
  }

  List<String> lessonsList = [
    "The Phi Story",
    "Introduction",
    "PHlchology",
    "Dr PHI",
    "Hygiene",
    "Products",
    "Pigment",
    "Starter Kit",
    "The Phi Story",
    "Introduction",
    "PHlchology",
    "Dr PHI",
    "Hygiene",
  ];

  List<String> levelList = [
    "Introduction",
    "PHlchology",
    "Dr PHI",
    "The Phi Story",
    "Introduction",
    "PHlchology",
    "Dr PHI",
    "Hygiene",
    "Products",
    "Pigment",
    "Starter Kit",
    "The Phi Story",
    "Introduction",
    "PHlchology",
    "Dr PHI",
    "Hygiene",
  ];
}
