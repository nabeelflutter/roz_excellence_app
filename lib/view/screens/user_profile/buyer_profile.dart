// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/extensions/extensions.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/models/course_modal.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/categore/categore_screen.dart';
import 'package:rose_excellence/view/screens/faveriout/faveriout_screen.dart';
import 'package:rose_excellence/view/screens/faveriout/widget/faveriout_widget.dart';
import 'package:rose_excellence/view/screens/user_profile/widget/list_widget.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../repository/auth_model.dart';
import '../../../view_model/user_info_screen_bloc/user_info_screen_bloc.dart';
import '../../../view_model/user_info_screen_bloc/user_info_screen_event.dart';
import '../../../view_model/user_info_screen_bloc/user_info_screen_state.dart';
import '../../global_widgets/dialogues/dialogues.dart';
import '../../global_widgets/global_widgets.dart';
import '../../global_widgets/widgets/boxshadow.dart';
import '../journal_screen/widget/my_courses_widget.dart';
import 'buyer_profile_behaviour.dart';

class BuyerProfile extends StatefulWidget {
  BuyerProfile({Key? key}) : super(key: key);
  List<CourseModal> allCourseList = [
    CourseModal(image: Assets.imagesTablet, name: "Browse"),
    CourseModal(image: Assets.imagesTablet, name: "Lashes"),
    CourseModal(image: Assets.imagesTablet, name: "Browse"),
    CourseModal(image: Assets.imagesTablet, name: "Lashes"),
    CourseModal(image: Assets.imagesTablet, name: "Browse"),
    CourseModal(image: Assets.imagesTablet, name: "Lashes"),
  ];

  @override
  State<BuyerProfile> createState() => _BuyerProfileState();
}

class _BuyerProfileState extends State<BuyerProfile>
    with BuyerProfileBehaviour {
  UserInfoScreenBloc userInfoBlocObject =
      UserInfoScreenBloc(UserInfoScreenInitialState());

  bool isEmailOrPhone = true;
  late TextEditingController extraController;

  @override
  void dispose() {
    // TODO: implement dispose
    /////// disposeUserInfoScreenTextControllers();
    extraController.dispose();
    super.dispose();
  }

  void callback() {
    getUserInFuture = authModel.getBasicInformation();
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInFuture = authModel.getBasicInformation();
    extraController = TextEditingController();
    callback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Constants.orrangeColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: AuthModel().getBasicInformation(),
          builder: (context, snapshot) {
            print('printing snapshot' + snapshot.data.toString());

            if (snapshot.hasData && snapshot.data != null) {
              print('printing snapshot ${snapshot.data!.data()}');

              if (snapshot.data!['email'] != null) {
                emailOrPhoneNumberController.text = snapshot.data!['email'];
                nameController.text = snapshot.data!['name'];
                if (snapshot.data!['name'] != null &&
                    snapshot.data!['name'] != '') {}
              }

              return Container(
                height: height,
                width: widht,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          BlocConsumer<UserInfoScreenBloc,
                              UserInfoScreenStates>(
                            bloc: userInfoBlocObject,
                            builder: (context, state) {
                              if (state is UserInfoScreenImageChangedState) {
                                return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(state.image))));
                              } else if (state
                                  is UserInfoScreenDetailLoadingState) {
                                return Center(
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    child: LoadingIndicator(
                                        indicatorType: Indicator.ballPulse,

                                        /// Required, The loading type of the widget
                                        colors: [
                                          Colors.black,
                                          Colors.orange,
                                          Colors.blueAccent,
                                        ],

                                        /// Optional, The color collections
                                        strokeWidth: 2,

                                        /// Optional, The stroke of the line, only applicable to widget which contains line
                                        backgroundColor: Colors.transparent,

                                        /// Optional, Background of the widget
                                        pathBackgroundColor: Colors.black

                                        /// Optional, the stroke backgroundColor
                                        ),
                                  ),
                                );
                              } else if (snapshot.data!['photoUrl'] == null) {
                                return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/dummy.png'))));
                              } else if (state
                                  is UserInfoScreenDatePickedStateState) {
                                return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data!['photoUrl']))));
                              } else {
                                return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data!['photoUrl']))));
                              }
                            },
                            listener: (context, state) {
                              if (state is UserInfoScreenErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.error)));
                              } else if (state is UserInfoScreenLoadedState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Updated!')));
                              } else if (state
                                  is UserInfoScreenDatePickedStateState) {
                                dobController.text = state.date;
                              }
                            },
                          ),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              top: 80,
                              child: InkWell(
                                onTap: () async {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) =>
                                        CupertinoActionSheet(actions: [
                                      CupertinoActionSheetAction(
                                          onPressed: () async {
                                            //closing the sheet
                                            Navigator.pop(context);

                                            image = await getImageFromGallery();

                                            if (image != null) {
                                              userInfoBlocObject.add(
                                                  UserInfoScreenPickImageEvent(
                                                      image: image!));
                                            }
                                          },
                                          child: Text(
                                            'Gallery',
                                            style: GoogleFonts.raleway(),
                                          )),
                                      CupertinoActionSheetAction(
                                          onPressed: () async {
                                            //closing the sheet
                                            Navigator.pop(context);

                                            image = await getImageFromCamera();

                                            if (image != null) {
                                              userInfoBlocObject.add(
                                                  UserInfoScreenPickImageEvent(
                                                      image: image!));
                                            }
                                          },
                                          child: Text(
                                            'Camera',
                                            style: GoogleFonts.raleway(),
                                          )),
                                    ]),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Image(
                                    image: AssetImage('assets/images/img.png'),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: widht * .02),
                      child: Text(
                        '${nameController.text.capitalize()}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: widht * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name',
                                  style: GoogleFonts.raleway(
                                      color: Constants.orrangeColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  nameController.text,
                                  style: GoogleFonts.raleway(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.person,
                              color: Constants.orrangeColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: widht * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email Address',
                                  style: GoogleFonts.raleway(
                                      color: Constants.orrangeColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  emailOrPhoneNumberController.text,
                                  style: GoogleFonts.raleway(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.email,
                              color: Constants.orrangeColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: widht * 0.02,
                                right: widht * 0.03,
                                bottom: height * 0.01,
                                top: height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextWidget(
                                    text: "My Courses",
                                    fontSize: 15,
                                    textColor: Constants.orrangeColor,
                                    fontWeight: FontWeight.bold),
                                MyTextWidget(
                                    onClick: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => CategoreScreen(),
                                      ));
                                    },
                                    text: "See All",
                                    fontSize: 15,
                                    textColor: Constants.orrangeColor,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: widht,
                            height: height * 0.17,
                            child: ListView.builder(
                              itemCount: FaverioutScreen.faverioutList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(),
                                  child: MyCourseListWidget(
                                      modal:
                                          FaverioutScreen.faverioutList[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyOutLineButton(
                          followText: "Delete",
                          textSize: 18,
                          textColor: Colors.white,
                          height: height * 0.06,
                          width: widht * 0.7,
                          borderColor: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('${snapshot.error}')));
              return Container(
                height: 0,
                width: 0,
              );
            } else {
              return Center(
                child: Container(
                  height: 30,
                  width: 60,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,

                      /// Required, The loading type of the widget
                      colors: [
                        Colors.brown,
                        Colors.orange,
                        Colors.blueAccent,
                      ],

                      /// Optional, The color collections
                      strokeWidth: 2,

                      /// Optional, The stroke of the line, only applicable to widget which contains line
                      backgroundColor: Colors.transparent,

                      /// Optional, Background of the widget
                      pathBackgroundColor: Colors.black

                      /// Optional, the stroke backgroundColor
                      ),
                ),
              );
            }
          },
        ));
  }
}
