// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';

import '../../global_widgets/global_widgets.dart';
import '../login_screen/login_screen.dart';
import '../sign_up_screen/signup_screen.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.orrangeColor,
        body: Column(
          children: [
            // Container(
            //   height: height * 0.4,
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //             height: 200,
            //             child: Image.asset(
            //               'assets/images/logo.png',
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: height * 0.55,
            ),
            Container(
              width: width,
              height: height * 0.07,
              color: Constants.orrangeColor,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.055),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                      text: "Etudier",
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.036,
                      textColor: AppColors.BUTTON_COLOR,
                    ),
                    MyTextWidget(
                      text: "Improve your Skill everytime and anytime",
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                      textColor: AppColors.BUTTON_COLOR,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.25,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    GlobalWidgets.CustomButton(
                        borderColor: Constants.orrangeColor,
                        context: context,
                        color: AppColors.BUTTON_COLOR,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.person,
                                  color: Constants.orrangeColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Login',
                              style: GoogleFonts.raleway(
                                  fontSize: 18, color: Constants.orrangeColor),
                            )
                          ],
                        ),
                        customOnTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        textColor: Colors.white),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalWidgets.CustomButton(
                        borderColor: Constants.orrangeColor,
                        context: context,
                        color: AppColors.BUTTON_COLOR,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.groups_2,
                                  color: Constants.orrangeColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Register',
                              style: GoogleFonts.raleway(
                                  fontSize: 18, color: Constants.orrangeColor),
                            )
                          ],
                        ),
                        customOnTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ));
                        },
                        textColor: Colors.white),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),

                    width: width * 0.5,
                    height: height * 0.07,
                    decoration: BoxDecoration(),

                    padding: const EdgeInsets.only(right: 5, bottom: 15),
                    child: Card(
                        borderOnForeground: true,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                                color: Constants.orrangeColor, width: 2)),
                        elevation: 3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.of(context)
                                        .push(CupertinoPageRoute(
                                      builder: (context) {
                                        return BottomNavigationScreen();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    'Explore App',
                                    style: GoogleFonts.raleway(
                                        color: Constants.orrangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              /*SizedBox(
                            width: 2,
                          ),*/
                              Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Constants.orrangeColor,
                                  ))
                            ])),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
