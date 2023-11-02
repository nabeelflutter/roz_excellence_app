// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/course_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:rose_excellence/view/screens/rating/rating_screen.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget({super.key, this.catagory,required this.coursePrice,required this.courseDuration,required this.courseName,required this.courseVideoUrl});
  String? catagory;
  String courseVideoUrl;
  String courseName;
  String coursePrice;
  String courseDuration;

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late VideoPlayerController _controller;
  ChewieController? chewicController;

  Future<void> loadVideoPlayer() async {
    _controller = VideoPlayerController.contentUri(Uri.parse(
        widget.courseVideoUrl));

    Future.wait([_controller.initialize()]);

    chewicController = ChewieController(
        videoPlayerController: _controller, autoPlay: false, looping: false);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      loadVideoPlayer();
    }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewicController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width,
      height: height * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            height: height * 0.15,
            child: chewicController != null
                ? Chewie(controller: chewicController!)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      MyTextWidget(
                        text: "Loading",
                      )
                    ],
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: SizedBox(
              width: width,
              height: height * 0.13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        fontSize: 18,
                        text: widget.courseName,
                        fontWeight: FontWeight.bold,
                        textColor: Constants.orrangeColor,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextWidget(
                        text: widget.catagory,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                      ),
                      MyTextWidget(
                        fontSize: 14,
                        text: widget.coursePrice,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.red,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextWidget(
                        text: 'English Language',
                        textColor: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      MyTextWidget(
                        fontSize: 14,
                        text: "Basic",
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextWidget(
                        text: "Shop",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                      ),
                      MyTextWidget(
                        fontSize: 12,
                        text: widget.courseDuration,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RatingScreen(),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextWidget(
                          text: "Rating",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              itemSize: 15,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            MyTextWidget(
                              onClick: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RatingScreen(),
                                ));
                              },
                              fontSize: 12,
                              text: "(30)",
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDailog extends StatelessWidget {
  MyDailog({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BottomNavigationScreen(),
      ));
    });
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextWidget(
            text: "Purchase Successfully",
            textColor: Colors.grey,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}
