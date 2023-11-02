// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/app_languages/english/localization.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/models/explore_screen_post_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/comment/comment_screen.dart';
import 'package:rose_excellence/view/screens/post/post_screen.dart';

class Explorepage extends StatefulWidget {
  Explorepage({super.key});

  List<PostModal> postList = [
    PostModal(
        image: Assets.imagesDummy,
        name: "Maria",
        subName: "Grand Master",
        date: "11 Mar",
        time: "00.18",
        postImage: Assets.imagesTablet),
    PostModal(
        image: Assets.imagesDummy,
        name: "Jenny",
        subName: "Grand Master",
        date: "12 Mar",
        time: "00.19",
        postImage: Assets.imagesTablet),
    PostModal(
        image: Assets.imagesDummy,
        name: "John",
        subName: "Grand Master",
        date: "13 Mar",
        time: "00.20",
        postImage: Assets.imagesTablet),
    PostModal(
        image: Assets.imagesDummy,
        name: "Miranda",
        subName: "Grand Master",
        date: "13 Mar",
        time: "00.20",
        postImage: Assets.imagesTablet)
  ];

  @override
  State<Explorepage> createState() => _HomepageState();
}

class _HomepageState extends State<Explorepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        backgroundColor: AppColors.WHITE_COLOR,
        leading: Center(child: Text('Explore',style: GoogleFonts.raleway(fontSize: 22,color: Constants.orrangeColor,fontWeight: FontWeight.bold),)),
        actions: [
          MyOutLineButton(
            textColor: Colors.white,
            height: 50,
            textSize: 12,
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostScreen(),
              ));
            },
            width: width * 0.45,
            followText: "CREAT NEW POST",
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: widget.postList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.08),
              child: ExploreScreenWidget(
                commentClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommentScreen(),
                  ));
                },
                commentColor: AppColors.APP_BLUE,
                buttonWidth: width * 0.27,
                buttonHeight: height * 0.05,
                image: widget.postList[index].image,
                name: widget.postList[index].name,
                subName: widget.postList[index].subName,
                date: widget.postList[index].date,
                time: widget.postList[index].time,
                postImage: widget.postList[index].postImage,
              ),
            );
          },
        ),
      ),
    );
  }
}
