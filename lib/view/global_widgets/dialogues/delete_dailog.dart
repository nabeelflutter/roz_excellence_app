import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';

class DeleteDailog extends StatelessWidget {
  const DeleteDailog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: MyTextWidget(
          onClick: () {},
          text: "Delete",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          textColor: AppColors.BLACK_COLOR),
      content: FittedBox(
        child: MyTextWidget(
          text: "Are you want to delete this item.",
          textColor: Colors.black,
        ),
      ),
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyOutLineButton(
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                  width: width * 0.2,
                  height: height * 0.05,
                  followText: "No",
                  borderColor: AppColors.APP_BLUE,
                  textColor: Colors.white,
                  textSize: 14,
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                MyOutLineButton(
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                  width: width * 0.2,
                  height: height * 0.05,
                  followText: "Yes",
                  borderColor: AppColors.APP_BLUE,
                  textColor: Colors.white,
                  textSize: 14,
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            )
          ],
        )
      ],
    );
  }
}
