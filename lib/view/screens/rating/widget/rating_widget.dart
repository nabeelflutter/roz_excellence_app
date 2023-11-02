import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/models/comment_modal.dart';
import 'package:rose_excellence/models/rating_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key, required this.modal});
  final RatingModal modal;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: height * 0.04,
            backgroundColor: AppColors.BUTTON_COLOR,
            backgroundImage: AssetImage(modal.image!),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: SizedBox(
              width: width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget(
                    text: modal.name,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.BLACK_COLOR,
                    fontSize: 17,
                  ),
                  SizedBox(height: 5,),
                  MyTextWidget(
                    text: "3 Weeks ago",
                    textColor: Colors.black,
                    fontSize: 12,
                  ),
                  SizedBox(height: 3,),

                  MyTextWidget(
                    text: modal.ratingText,
                    textColor: Colors.black,
                    fontSize: 14,
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: height * 0.025,
                    color: AppColors.amberColor,
                  ),
                  MyTextWidget(
                    text: "5.0",
                    textColor: AppColors.amberColor,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
