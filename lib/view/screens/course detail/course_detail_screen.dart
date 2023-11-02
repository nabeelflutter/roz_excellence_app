// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/course_detail_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/course%20detail/widget/course_widget.dart';
import 'package:rose_excellence/view/screens/video_submet/video_submet_screent.dart';

import '../play_video_screen/play_video_screen.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({super.key});

  List<VideoTileModal> list = [
    VideoTileModal(
        count: "01",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "02",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "03",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "04",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "05",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "06",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "07",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "05",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "06",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
    VideoTileModal(
        count: "07",
        title: "Introduction",
        subTitle: "File Presentation, video and Quiz"),
  ];
int trimLines = 3;
  String? filepath;
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.orrangeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.BUTTON_COLOR,
            )),
        centerTitle: true,
        title: MyTextWidget(
            text: "UI/UX Design",
            textColor: AppColors.BUTTON_COLOR,
            fontWeight: FontWeight.w600),
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Container(
          width: width,
          color: AppColors.BUTTON_COLOR,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.02),
                child: SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        text: "1 - Intro to Typography",
                        textColor: AppColors.BLACK_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.021,
                      ),
                      SizedBox(
                        height: height * 0.003,
                      ),
                      MyTextWidget(
                        text: "Typography for UI/UX",
                        textColor: AppColors.APP_BLUE,
                        fontSize: height * 0.018,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05,
                      top: height * 0.025,
                      right: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        onClick: () {},
                        text: "Description",
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.021,
                        textColor: AppColors.BLACK_COLOR,
                      ),
                      StreamBuilder(
                        stream:   FirebaseFirestore.instance.collection('Lessons').doc(data['courseId']).collection('LessonData').doc(data['lessonId']).snapshots(),
                        builder: (context, snapshot) {

                              if(!snapshot.hasData){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              else if(snapshot.hasError){
                                return Center(child: Text('Something went wrong'),);
                              }
                              return ReadMoreText(
                                snapshot.data!.data()!['lessonDescription'],
                                trimLines: 3,
                                style: TextStyle(
                                    color: AppColors.APP_BLUE,
                                    fontSize: height * 0.019),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                lessStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                moreStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              );
                            }

                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        StreamBuilder(
            stream:   FirebaseFirestore.instance.collection('Videos').doc(data['lessonId']).collection('Videos').snapshots(),
            builder: (context, snapshot) {
                 if(snapshot.hasError){
                   return Center(child: Text('Something went wrong'),);
                 }
                 else if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator(),);
                 }
                 return Column(
                   children: List.generate(
                       snapshot.data!.docs.length, (index) =>CourseDetailTile(
                     onClick: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return PlayVideoScreen(videoPath: snapshot.data!.docs[index]['videoUrl'], videoSubTitle: snapshot.data!.docs[index]['videoSubTitle'], videoTitle: snapshot.data!.docs[index]['videoTitle'],);
                       },));
                     },
                     videoTitle: snapshot.data!.docs[index]['videoTitle'], videoSubTitle:  snapshot.data!.docs[index]['videoSubTitle'],index: index.toString(),)
                   ),
                 );
          }
        ),
        SizedBox(
          height: height * 0.03,
        ),
          // StreamBuilder(stream: FirebaseFirestore.instance.collection('Assignments').doc(data['lessonId']).collection('Assignments').doc().snapshots(),
          //     builder: (context, snapshot){
          //   if(snapshot.hasError){
          //     return Center(child: SizedBox(),);
          //   }
          //  else if(snapshot.hasData){
          //     filepath = snapshot.data!.data()!['assignmentsfileUrl'];
          //     return SizedBox();
          //   }
          //  return SizedBox();
          //     }
          //     ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Assignments').doc(data['courseId']).collection('Assignments').doc(data['lessonId']).snapshots(),
          builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasError){
                return Text('Something went wrong');
              }
              return MyOutLineButton(
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoSubmetScreen(lessonId: data['lessonId'], assignmentFileUrl: snapshot.data!.data()!['assignmentsfileUrl'], courseId: data['courseId'],),
                  ));
                },
                followText: "Take Assignment",
                height: height * 0.065,
                width: width * 0.7,
                textColor: AppColors.BUTTON_COLOR,
                textSize: height * 0.023,
              );
          }
        ),
      ]),
    );
  }
}





// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:rose_excellence/constants/app_colors/app_colors.dart';
// import 'package:rose_excellence/constants/constants/constant.dart';
// import 'package:rose_excellence/generated/assets.dart';
// import 'package:rose_excellence/models/course_detail_modal.dart';
// import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
// import 'package:rose_excellence/view/global_widgets/widgets/textfields.dart';
// import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
// import 'package:rose_excellence/view/screens/UI%20ux%20Design/ui_ux_designer.dart';
// import 'package:rose_excellence/view/screens/course%20detail/widget/course_widget.dart';

// class CourseDetail extends StatelessWidget {
//   CourseDetail({super.key});
//   List<VideoTileModal> list = [
//     VideoTileModal(
//         count: "01",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "02",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "03",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "04",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "05",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "06",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//     VideoTileModal(
//         count: "07",
//         title: "Introduction",
//         subTitle: "File Presentation, video and Quiz"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var width = size.width;
//     var height = size.height;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.black,
//             )),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.bookmark_border_outlined,
//                 color: Colors.black,
//               ))
//         ],
//       ),
//       body: Container(
//           width: width,
//           height: height,
//           color: Colors.white,
//           child: Column(
//             children: [
//               Container(
//                 width: width,
//                 height: height * 0.35,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30)),
//                     image: DecorationImage(
//                       image: AssetImage(
//                         Assets.imagesTablet,
//                       ),
//                       fit: BoxFit.fill,
//                     )),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: height * 0.1,
//                     ),
//                     MyTextWidget(
//                       text: "Data Science",
//                       fontSize: height * 0.025,
//                       fontWeight: FontWeight.bold,
//                       textColor: Colors.black,
//                     ),
//                     SizedBox(
//                       height: height * 0.1,
//                     ),
//                     MyTextField(
//                       width: width * 0.8,
//                       hint: "Start a Course",
//                       suffix: Icon(
//                         Icons.play_circle_outline_outlined,
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: width * 0.05,
//                         top: height * 0.02,
//                         bottom: height * 0.02),
//                     child: MyTextWidget(
//                       text: "Course Details",
//                       textColor: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: height * 0.022,
//                     ),
//                   ),
//                   SizedBox(
//                     width: width,
//                     height: height * 0.45,
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: list.length,
//                       itemBuilder: (context, index) {
//                         return CourseDetailTile(
//                             onClick: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => UIUXDesignerScreen(),
//                               ));
//                             },
//                             modal: list[index]);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.025,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       MyOutLineButton(
//                         width: width * 0.7,
//                         height: height * 0.07,
//                         followText: "Buy Now",
//                         textSize: height * 0.025,
//                         textColor: AppColors.BUTTON_COLOR,
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           )),
//     );
//   }
// }
