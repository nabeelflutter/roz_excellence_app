// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class MyBottomheet extends StatelessWidget {
  MyBottomheet({super.key, this.cameraClick, this.galleryClick});
  GestureTapCallback? galleryClick;
  GestureTapCallback? cameraClick;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      height: height * 0.2,
      decoration: BoxDecoration(

          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 10, color: AppColors.BUTTON_COLOR)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: galleryClick,
                child: Icon(
                  Icons.photo_camera_back,
                  color: Constants.orrangeColor,
                  size: height * 0.05,
                ),
              ),
              SizedBox(height: 5,),
              MyTextWidget(text: "Gallery",textColor: Constants.orrangeColor,fontWeight: FontWeight.bold,)
            ],
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: cameraClick,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Constants.orrangeColor,
                  size: height * 0.05,
                ),
              ),
              SizedBox(height: 5,),
              MyTextWidget(text: "Camera",textColor: Constants.orrangeColor,fontWeight: FontWeight.bold,)
            ],
          ),
        ],
      ),
    );
  }
}
