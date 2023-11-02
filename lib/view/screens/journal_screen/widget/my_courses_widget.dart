import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/models/course_modal.dart';

import '../../../../models/mycourse_modal.dart';
import '../../../global_widgets/global_widgets.dart';

class MyCoursesWidget extends StatelessWidget {
  MyCoursesWidget({super.key, required this.model});
  final CourseModal model;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width * 0.22,
      height: height * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * 0.22,
            height: height * 0.07,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(model.image!), fit: BoxFit.fill)),
          ),
          FittedBox(
            child: MyTextWidget(
              text: model.name,
              textColor: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
