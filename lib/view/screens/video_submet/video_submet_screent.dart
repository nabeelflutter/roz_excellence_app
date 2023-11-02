// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/add%20work/add_work_screen.dart';
import 'package:video_player/video_player.dart';

class VideoSubmetScreen extends StatefulWidget {
  String lessonId;
  String courseId;
  String assignmentFileUrl;

  VideoSubmetScreen(
      {super.key, required this.lessonId, required this.assignmentFileUrl, required this.courseId});

  @override
  State<VideoSubmetScreen> createState() => _VideoSubmetScreenState();
}

class _VideoSubmetScreenState extends State<VideoSubmetScreen> {
  late VideoPlayerController _controller;
  ChewieController? chewicController;

  Future<void> loadVideoPlayer() async {
    _controller = VideoPlayerController.contentUri(Uri.parse(
        widget.assignmentFileUrl.toString()));

    Future.wait([_controller.initialize()]);

    chewicController = ChewieController(
        videoPlayerController: _controller, autoPlay: false, looping: false);
  }
  int? result;
  @override
  void initState() {
    super.initState();
    String inputString = widget.assignmentFileUrl;
     result = findKeyword(inputString);
    setState(() {
      loadVideoPlayer();
    });
    print(widget.lessonId);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewicController!.dispose();
  }

  List<dynamic> questionsList = [];

  int findKeyword(String input) {
    if (input.contains("videos")) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      backgroundColor: AppColors.BUTTON_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.BUTTON_COLOR,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: width,
            height: height,
            color: Colors.white,
            child: Column(
                children: [
                  result == 1? Container(
              width: width,
              height: height * 0.3,
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
            ):CachedNetworkImage(
                imageUrl: widget.assignmentFileUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ) ,
        //         widget.assignmentFileUrl.endsWith('.jpg') ||
        //         widget.assignmentFileUrl.endsWith('.jpeg') ||
        //         widget.assignmentFileUrl.endsWith('.png')?
        //  CachedNetworkImage(
        //   imageUrl: widget.assignmentFileUrl,
        //   placeholder: (context, url) => CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ) : Container(
        //   width: width,
        //   height: height * 0.3,
        //   child: chewicController != null
        //       ? Chewie(controller: chewicController!)
        //       : Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       CircularProgressIndicator(),
        //       MyTextWidget(
        //         text: "Loading",
        //       )
        //     ],
        //   ),
        // ),
        SizedBox(
          height: height * 0.06,
        ),
        Container(
          height: height * .30,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Assignments').doc(
                  widget.courseId).collection('Assignments')
                  .doc(widget.lessonId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'),);
                }
                var questionsData = snapshot.data!.data()!['questions'];
                questionsList = List<dynamic>.from(questionsData);
                return ListView.builder(
                  itemCount: questionsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextWidget(
                        text: questionsList[index].toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.023,
                      ),
                    );
                  },);
              }
          ),),
        MyOutLineButton(
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddWorkScreen(
                  lessonId: widget.lessonId, courseId: widget.courseId),
            ));
          },
          width: width * 0.7,
          height: height * 0.065,
          followText: "Submit",
          textColor: AppColors.BUTTON_COLOR,
          textSize: height * 0.027,
        )
        ],
    ),),
      )
    ,
    );
  }
}
