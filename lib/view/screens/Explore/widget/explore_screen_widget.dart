// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class ExploreScreenWidget extends StatelessWidget {
  ExploreScreenWidget(
      {super.key,
      this.faverioutClick,
      this.commentClick,
      this.followClick,
      this.faverioutColor,
      this.commentColor,
      this.bookmarkColor,
      this.bookmarkClick,
      this.image,
      this.name,
      this.subName,
      this.date,
      this.time,
      this.buttonWidth,
      this.buttonHeight,
      this.postImage});
  void Function()? faverioutClick;
  void Function()? commentClick;
  void Function()? bookmarkClick;
  void Function()? followClick;
  Color? faverioutColor;
  Color? commentColor;
  Color? bookmarkColor;
  String? image;
  String? name;
  String? subName;
  String? date;
  String? time;
  double? buttonWidth;
  double? buttonHeight;

  String? postImage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      height: height * 0.58,
      decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: width * 0.02,
                left: width * 0.03,
                right: width * 0.03,
                bottom: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: height * 0.035,
                      backgroundColor: AppColors.WHITE_COLOR,
                      backgroundImage: AssetImage(image!),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextWidget(
                          text: name,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: height * 0.006,
                        ),
                        MyTextWidget(
                          text: subName,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          textColor: Colors.black,
                        ),
                        SizedBox(
                          height: height * 0.006,
                        ),
                        Row(
                          children: [
                            MyTextWidget(
                              text: date,
                              fontSize: 12,
                              textColor: Colors.black,
                            ),
                            MyTextWidget(
                              text: " at ",
                              fontSize: 12,
                              textColor: Colors.black,
                            ),
                            MyTextWidget(
                              text: time,
                              fontSize: 12,
                              textColor: Colors.black,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                // MyOutLineButton(
                //   width: buttonWidth,
                //   height: buttonHeight,
                //   onClick: followClick,
                //   followText: followText,
                //   borderColor: borderColor,
                // )
              ],
            ),
          ),
          Container(
            width: width,
            height: height * 0.35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(postImage!), fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.02, left: width * 0.04),
            child: Row(
              children: [
                MyTextWidget(
                  text: "2 Like  -  0 Comments",
                  fontSize: 11,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: width * 0.03, left: width * 0.01, right: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Row(
                    children: [
                      MyIconButton(
                          icon: Icons.favorite,
                          onClick: faverioutClick,
                          iconColor: Colors.red),
                      MyIconButton(
                          icon: Icons.comment,
                          onClick: commentClick,
                          iconColor: Constants.orrangeColor),
                      MyIconButton(
                          icon: Icons.bookmark,
                          onClick: bookmarkClick,
                          iconColor: Constants.orrangeColor),
                    ],
                  ),
                ),
                MyIconButton(
                  icon: Icons.more_vert_outlined,
                  iconColor: Constants.orrangeColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  MyIconButton(
      {super.key, this.onClick, this.icon, this.iconColor = Colors.grey});
  void Function()? onClick;
  IconData? icon;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onClick,
        icon: Icon(
          icon,
          color: iconColor,
        ));
  }
}

class MyOutLineButton extends StatelessWidget {
  MyOutLineButton(
      {super.key,
      this.onClick,
      this.width,
      this.textSize = 10,
      this.height,
      this.textColor = Colors.grey,
      this.borderColor = Colors.grey,
      this.followText});
  void Function()? onClick;
  Color? borderColor;
  String? followText;
  double? width;
  double? height;
  double? textSize;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Constants.orrangeColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: borderColor!),
              boxShadow: [BoxShadow(color: borderColor!, blurRadius: 1)]),
          child: Center(
            child: MyTextWidget(
              text: followText,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
              textColor: textColor,
            ),
          ),
        ));
  }
}
