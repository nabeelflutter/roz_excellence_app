import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/course_modal.dart';

import '../../../../models/mycourse_modal.dart';
import '../../../global_widgets/global_widgets.dart';

class CourseModalWidget extends StatelessWidget {

  CourseModalWidget({super.key,  this.onClick,required this.courseName,required this.courseDuration,required this.coursePrice,required this.courseImage});
  String courseImage;
  String courseName;
  String courseDuration;
  String coursePrice;
  void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height * 0.13,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.03,
            ),
            Container(
              width: width * 0.3,
              height: height * 0.13,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(courseImage), fit: BoxFit.fill)),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(top: width * 0.01, bottom: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: MyTextWidget(
                      text: courseName,
                      fontWeight: FontWeight.bold,
                      textColor: Constants.orrangeColor,
                      fontSize: height * 0.02,
                    ),
                  ),
                  MyTextWidget(
                    text: '${courseDuration} month',
                    fontWeight: FontWeight.bold,
                    textColor: Constants.borderColor
                    ,
                    fontSize: 11,
                  ),
                  MyTextWidget(
                    text: '${coursePrice} EUR',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    textColor: Colors.red,
                  ),
                  MyTextWidget(
                    text:  "English Language ",
                    fontWeight: FontWeight.w500,
                    textColor: Constants.orrangeColor,
                    fontSize: 11,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 15,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
