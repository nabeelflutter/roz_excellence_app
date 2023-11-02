import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/models/course_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/global_widgets/widgets/textfields.dart';
import 'package:rose_excellence/view/screens/Detail/detail_screen.dart';
import 'package:rose_excellence/view/screens/journal_screen/widget/courses_widget.dart';
import 'package:rose_excellence/view/screens/journal_screen/widget/my_courses_widget.dart';
import '../rating_screen.dart';

class Course extends StatefulWidget {
  Course({super.key});
  static int currentListIndex = 0;
  static void toggleIndex(int value) {
    currentListIndex = value;
  }

  static List<CourseModal> myCourseList = [
    CourseModal(image: Assets.imagesTablet, name: "Browse"),
    CourseModal(image: Assets.imagesTablet, name: "Lashes"),
  ];

  static List<CourseModal> courseList = [
    CourseModal(
        image: Assets.imagesTablet,
        name: "Saiko",
        month: "3 Month",
        price: "0 EUR",
        language: "English Language "),
    CourseModal(
        image: Assets.imagesTablet,
        name: "Phinjection",
        month: "6 Month",
        price: "40 EUR",
        language: "English Language "),
    CourseModal(
        image: Assets.imagesTablet,
        name: "Perfection",
        month: "4 Month",
        price: "10 EUR",
        language: "English"),
    CourseModal(
        image: Assets.imagesTablet,
        name: "PhiBright",
        month: "4 Month",
        price: "20 EUR",
        language: "English Language "),
    CourseModal(
        image: Assets.imagesTablet,
        name: "PhiShading",
        month: "5 Month",
        price: "30 EUR",
        language: "English Language "),
    CourseModal(
        image: Assets.imagesTablet,
        name: "Browse",
        month: "3 Month",
        price: "0 EUR",
        language: "English Language ")
  ];

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.03),
            child: Icon(
              Icons.notifications_none,
              color: Constants.orrangeColor,
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: MyTextWidget(
          text: "All Courses",
          fontSize: 20,
          textColor: Constants.orrangeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: [
                MyTextField(
                  width: width,
                  hint: "Type to Search",
                  prefix: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                    bottom: height * 0.01,
                    top: height * 0.01,
                  ),
                  child: Row(
                    children: [
                      MyTextWidget(
                        text: "My Courses",
                        fontSize: 17,
                        textColor: Constants.orrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: width,
              height: height * 0.12,
              child: ListView.builder(
                itemCount: Course.myCourseList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.01,
                      left: width * 0.025,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ReviewScreen();
                          },
                        ));
                      },
                      child: MyCoursesWidget(
                        model: Course.myCourseList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.03,
                top: height * 0.02,
                bottom: height * 0.02,
              ),
              child: Row(
                children: [
                  MyTextWidget(
                    text: "Courses",
                    textColor: Constants.orrangeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),);
              }
             else if(snapshot.hasError){
                return SliverToBoxAdapter(child: Center(child: Text('Something went wrong'),),);
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.03),
                    child: CourseModalWidget(
                      onClick: () {
                        Course.toggleIndex(index);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                          settings: RouteSettings(
                           // arguments: Course.courseList[index],
                            arguments:({
                              'courseId': snapshot.data!.docs[index]['courseId']
                            })
                          ),
                        ));
                      }, courseName: snapshot.data!.docs[index]['courseName'], courseDuration: snapshot.data!.docs[index]['courseDuration'], coursePrice: snapshot.data!.docs[index]['coursePrice'], courseImage: snapshot.data!.docs[index]['courseImage'],
                    ),
                  );
                }, childCount: snapshot.data!.docs.length),
              );
            }
          ),
        ],
      ),
    );
  }
}
