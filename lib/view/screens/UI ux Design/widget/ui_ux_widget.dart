import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/ui_ux_model.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

class MyListTile extends StatelessWidget {
  MyListTile({super.key, required this.modal});
  final UIUXModal modal;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.APP_BLUE, width: 0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
            child: Container(
              width: width * 0.21,
              height: height * 0.08,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(modal.image!), fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.009),
            child: SizedBox(
              width: width * 0.67,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        text: modal.title,
                        textColor: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      MyTextWidget(
                        text: modal.subTitle,
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  MyTextWidget(
                    text: modal.time,
                    fontSize: 12,
                    textColor: Constants.orrangeColor,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
