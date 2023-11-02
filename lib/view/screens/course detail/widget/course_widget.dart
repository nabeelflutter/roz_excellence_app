// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/course_detail_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class CourseDetailTile extends StatelessWidget {
  CourseDetailTile({super.key, this.onClick,required this.videoTitle,required this.videoSubTitle,required this.index});
  GestureTapCallback? onClick;
  String videoTitle;
  String videoSubTitle;
  String index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return ListTile(
      onTap: onClick,
      dense: false,
      leading: MyTextWidget(
        text: index,
        textColor: Constants.orrangeColor,
      ),
      title: MyTextWidget(
          text: videoTitle,
          textColor: Constants.orrangeColor,
          fontSize: height * 0.02,
          fontWeight: FontWeight.bold),
      subtitle: MyTextWidget(
          text: videoSubTitle,
          fontSize: height * 0.02,
          fontWeight: FontWeight.bold),
      trailing: Icon(
        Icons.play_circle_fill_rounded,
        color: Constants.orrangeColor,
      ),
    );
  }
}
