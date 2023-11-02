import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../../repository/auth_model.dart';
import '../../global_widgets/widgets/buttons.dart';
import '../../global_widgets/widgets/dialogues.dart';
import '../login_or_signup_screen/login_or_sign_up_screen.dart';
import '../login_screen/login_screen.dart';
import '../support.dart';
import '../support_screen/support.dart';
import '../text_screen.dart';
import '../user_profile/buyer_profile.dart';

class SettingsAndProfileScreen extends StatefulWidget {
  const SettingsAndProfileScreen({Key? key}) : super(key: key);

  @override
  State<SettingsAndProfileScreen> createState() =>
      _SettingsAndProfileScreenState();
}

class _SettingsAndProfileScreenState extends State<SettingsAndProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    String userName = '';
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: Stack(
            children: [
              Container(
                height: height * .2,
                color: Constants.orrangeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height * .05),
                      child: Text(
                        'User Profile',
                        style: GoogleFonts.raleway(
                            fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .12),
                child: Container(
                  height: height,
                  width: widht,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      AuthModel().authentication.currentUser != null
                          ? Container(
                              height: height * .15,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return BuyerProfile();
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: widht * .07,
                                        ),
                                        child: FutureBuilder(
                                          future: FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .get(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data!
                                                        .data()!['photoUrl'] !=
                                                    null) {
                                              userName =
                                                  '${snapshot.data!.data()!['name']}';
                                              print(
                                                  'printing name ${userName}');
                                              return Container(
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                    color: Colors.blue,
                                                    shape: BoxShape.circle),
                                                child: ClipOval(
                                                    child: CachedNetworkImage(
                                                  imageUrl: snapshot.data!
                                                      .data()!['photoUrl'],
                                                  fit: BoxFit.cover,
                                                )),
                                              );
                                            } else if (snapshot.data != null &&
                                                snapshot.data!
                                                        .data()!['photoUrl'] ==
                                                    null) {
                                              return Container(
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'assets/images/tablet.png')),
                                                    color: Colors.blue,
                                                    shape: BoxShape.circle),
                                              );
                                            } else {
                                              return Center(
                                                child: Container(
                                                  height: 30,
                                                  width: 60,
                                                  child: const LoadingIndicator(
                                                      indicatorType:
                                                          Indicator.ballPulse,

                                                      /// Required, The loading type of the widget
                                                      colors: [
                                                        Colors.brown,
                                                        Colors.orange,
                                                        Colors.blueAccent,
                                                      ],

                                                      /// Optional, The color collections
                                                      strokeWidth: 2,

                                                      /// Optional, The stroke of the line, only applicable to widget which contains line
                                                      backgroundColor:
                                                          Colors.transparent,

                                                      /// Optional, Background of the widget
                                                      pathBackgroundColor:
                                                          Colors.black

                                                      /// Optional, the stroke backgroundColor
                                                      ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        'View Profile',
                                        style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          color: Constants.orrangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1,
                          //height: height*.02,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return TextScreen(id: 'Privacy Policy');
                            },
                          ));
                        },
                        leading: const Image(
                          image: AssetImage('assets/images/setting.png'),
                        ),
                        title: Text(
                          'Privacy Policy',
                          style: GoogleFonts.raleway(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1,
                          //height: height*.02,
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          if (AuthModel().authentication.currentUser == null) {
                            await GeneralDialogs.showLoginDialogue(context);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const Support();
                              },
                            ));
                          }
                        },
                        leading: const Image(
                          image: AssetImage('assets/images/suport.png'),
                        ),
                        title: Text(
                          'Supports',
                          style: GoogleFonts.raleway(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1,
                          // height: height*.02,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return TextScreen(id: 'Terms & Conditions');
                            },
                          ));
                        },
                        leading: const Image(
                          image: AssetImage('assets/images/terms.png',),
                        ),
                        title: Text(
                          'Terms & Conditions',
                          style: GoogleFonts.raleway(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1,
                          //height: height*.02,
                        ),
                      ),
                      AuthModel().authentication.currentUser == null
                          ? Expanded(
                              child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              child: LoginOrSignUpPageButton(
                                  function: () async {
                                    await GeneralDialogs.showLoginDialogue(
                                        context);
                                  },
                                  width: widht * .8,
                                  color: Colors.transparent,
                                  height: 50,
                                  buttonText: 'Login',
                                  textColor: Colors.white,
                                  borderColor: Colors.transparent),
                            ))
                          : Expanded(
                              child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              child: LoginOrSignUpPageButton(
                                  function: () {
                                    AuthModel().logout();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginOrSignUpScreen(),
                                        ),
                                        (route) => false);
                                  },
                                  width: widht * .8,
                                  color: Colors.transparent,
                                  height: 50,
                                  buttonText: 'Log Out',
                                  buttonTextWidget: MyTextWidget(
                                    text: "Logout",
                                    textColor: Colors.white,
                                  ),
                                  textColor: Colors.white,
                                  backgroundColor:Constants.orrangeColor,
                                  borderColor: Constants.orrangeColor),
                            ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
