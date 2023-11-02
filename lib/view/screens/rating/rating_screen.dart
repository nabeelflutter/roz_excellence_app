import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/models/rating_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/rating/widget/rating_widget.dart';

class RatingScreen extends StatelessWidget {
  RatingScreen({super.key});
  List<RatingModal> list = [
    RatingModal(
        image: Assets.imagesDummy,
        name: "John",
        ratingText: "This is course is really helpful in manageging my lifestyle"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        ratingText: "I learned a lot through this course"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Edward",
        ratingText: "Thanks for sharing this course"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "John",
        ratingText: "This is course is really helpful in manageging my lifestyle"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        ratingText: "I learned a lot through this course"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Edward",
        ratingText: "Thanks for sharing this course"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "John",
        ratingText: "This is course is really helpful in manageging my lifestyle"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        ratingText: "I learned a lot through this course"),
    RatingModal(
        image: Assets.imagesDummy,
        name: "Edward",
        ratingText: "Thanks for sharing this course"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Constants.orrangeColor,
              )),
          backgroundColor: AppColors.BUTTON_COLOR,
          centerTitle: true,
          title: MyTextWidget(
            text: "Rating",
            textColor: Constants.orrangeColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      body: Container(
        width: width,
        height: height,
        color: AppColors.BUTTON_COLOR,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03,
                  right: width * 0.03,
                  top: height * 0.02,
                  bottom: height * 0.02),
              child: RatingWidget(modal: list[index]),
            );
          },
        ),
      ),
    );
  }
}
