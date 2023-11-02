import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/models/comment_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/global_widgets/widgets/textfields.dart';
import 'package:rose_excellence/view/screens/comment/widget/comment_widget.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
  List<CommentModal> list = [
    CommentModal(
        image: Assets.imagesDummy,
        name: "John",
        comment: "Can anyone help ?"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        comment: "It was awesome"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Edward",
        comment: "yes"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "John",
        comment: "Can anyone help ?"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        comment: "It was awesome"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Edward",
        comment: "yes"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "John",
        comment: "Can anyone help ?"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        comment: "It was awesome"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Edward",
        comment: "yes"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "John",
        comment: "Can anyone help ?"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Stacy",
        comment: "It was awesome"),
    CommentModal(
        image: Assets.imagesDummy,
        name: "Edward",
        comment: "yes"),
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
            text: "Comments",
            textColor: Constants.orrangeColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyTextWidget(
              text: "Top Comment",
              fontWeight: FontWeight.bold,
              fontSize: 16,
              textColor: AppColors.BLACK_COLOR,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.02),
                child: CommentWidget(modal: list[index]),
              );
            },
          )),
          SizedBox(
              width: width,
              height: height * 0.15,
              child: MyTextField(
                suffix:  FloatingActionButton(backgroundColor: Constants.orrangeColor,onPressed: () {

                },child: Icon(Icons.send,color: Colors.white,),),

                hint: "Comment as Shahroz Khalid",
              ),)
        ],
      ),
    );
  }
}
