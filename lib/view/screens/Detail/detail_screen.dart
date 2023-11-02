// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, iterable_contains_unrelated_type

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/models/course_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/Detail/detail_behaviour.dart';
import 'package:rose_excellence/view/screens/Detail/widget/detail_widget.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/UI%20ux%20Design/ui_ux_designer.dart';
import 'package:rose_excellence/view/screens/course%20detail/course_detail_screen.dart';
import 'package:rose_excellence/view/screens/journal_screen/journal_screen.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with DetailBehaviour {
  @override
  void initState() {
    initStateDetail();
    super.initState();
  }

  @override
  void dispose() {
    disposeDetail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Constants.orrangeColor,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: CircleAvatar(
              backgroundColor: AppColors.APP_BLUE.withOpacity(0.3),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            ),
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Courses').doc(data['courseId']).snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text('Something went wrong'),);
                }
                return DetailWidget(catagory: "BROWS", coursePrice:  snapshot.data!.data()!['coursePrice'].toString(), courseDuration:  snapshot.data!.data()!['courseDuration'].toString(), courseName:  snapshot.data!.data()!['courseName'].toString(), courseVideoUrl:  snapshot.data!.data()!['videoUrl'].toString(),);

              }
            ),
            SizedBox(
              width: width,
              height: height * 0.08,
              child: Card(
                elevation: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width * 0.9,
                        child: InkWell(
                          onTap: () {
                            controller.jumpToPage(0);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTextWidget(
                                text: "Lessons",
                                fontWeight: currentIndex == 0
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                                fontSize: currentIndex == 0 ? 18 : 16,
                                textColor: currentIndex == 0
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                      // SizedBox(
                      //   width: 7,
                      // ),
                      ,
                      // VerticalDivider(
                      //   width: 30.0,
                      //   thickness: 2.0,
                      //   color: Colors.grey,
                      //   indent: 15.0,
                      //   endIndent: 5.0,
                      // ),
                      // SizedBox(
                      //   width: width * 0.4,
                      //   child: InkWell(
                      //     onTap: () {
                      //       controller.jumpToPage(1);
                      //     },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         MyTextWidget(
                      //           text: "Levels",
                      //           fontWeight: currentIndex == 1
                      //               ? FontWeight.bold
                      //               : FontWeight.w600,
                      //           fontSize: currentIndex == 1 ? 18 : 16,
                      //           textColor: currentIndex == 1
                      //               ? Colors.black
                      //               : Colors.black,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ]),
              ),
            ),
            Expanded(
                child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              children: [
                Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Lessons').doc(data['courseId']).collection('LessonData').snapshots(),
                    builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else if(snapshot.hasError){
                          return Center(child: Text('Something went wrong'),);
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.07,
                                  // top: width * 0.04,
                                  right: width * 0.04,
                                  bottom: width * 0.01),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CourseDetail(),
                                    settings: RouteSettings(
                                        arguments:({
                                          'lessonId':snapshot.data!.docs[index]['lessonId'],
                                          'courseId': data['courseId']
                                        })
                                    ),
                                  ));
                                },
                                child: SizedBox(
                                  height: height * 0.07,
                                  child: Card(
                                    elevation: 0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyTextWidget(
                                          fontWeight: FontWeight.w500,
                                          textColor: Constants.orrangeColor,
                                          fontSize: 15,
                                          text: snapshot.data!.docs[index]['lessonName'],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: height * 0.025,
                                          color: Constants.orrangeColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                    }
                  ),
                ),
                // Container(
                //   child: ListView.builder(
                //     itemCount: levelList.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.only(
                //             left: width * 0.07,
                //             top: width * 0.04,
                //             right: width * 0.04,
                //             bottom: width * 0.01),
                //         child: InkWell(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               MyTextWidget(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 15,
                //                 text: levelList[index],
                //               ),
                //               Icon(
                //                 Icons.arrow_forward_ios_sharp,
                //                 size: height * 0.025,
                //                 color: Colors.black,
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            )),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                MyOutLineButton(
                  width: width * 0.6,
                  height: height * 0.065,
                  followText: "Purchase",
                  textColor: Colors.white,
                  textSize: 18,
                  borderColor: Constants.orrangeColor,
                  onClick: () {
                    if (Course.myCourseList
                        .contains(Course.courseList[Course.currentListIndex])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: MyTextWidget(text: "add already")));
                    } else {
                      Course.myCourseList
                          .add(Course.courseList[Course.currentListIndex]);

                      showDialog(
                        context: context,
                        builder: (context) => MyDailog(),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.orrangeColor,
          onPressed: () {},
          child: Icon(
            Icons.chat,
            color: AppColors.BUTTON_COLOR,
          )),
    );
  }
}
