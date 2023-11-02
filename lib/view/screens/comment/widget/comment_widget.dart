import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/models/comment_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class CommentWidget extends StatelessWidget {
  CommentWidget({super.key, required this.modal});
  final CommentModal modal;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      child: Row(
        children: [
          CircleAvatar(
            radius: height * 0.04,
            backgroundColor: AppColors.BUTTON_COLOR,
            backgroundImage: AssetImage(modal.image!),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                  text: modal.name,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.BLACK_COLOR,
                  fontSize: 17,
                ),
                MyTextWidget(
                  text: modal.comment,
                  textColor: AppColors.APP_BLUE,
                  fontSize: 14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
