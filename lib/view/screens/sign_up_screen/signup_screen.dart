import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:rose_excellence/view/screens/homescreen/homepage.dart';
import '../../../../constants/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/buyer.dart';
import '../../../view_model/signup_bloc/signup_bloc.dart';
import '../../../view_model/signup_bloc/signup_event.dart';
import '../../../view_model/signup_bloc/signup_state.dart';
import '../../../view_model/social_sign_in_bloc/signin_with_google_bloc.dart';
import '../../global_widgets/dialogues/dialogues.dart';
import '../../global_widgets/widgets/buttons.dart';
import '../../global_widgets/widgets/dialogues.dart';
import '../login_screen/login_screen.dart';
import '../text_screen_initial.dart';
import '../widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool checkBoxValueOne = false;
  bool checkBoxValueTwo = false;
  bool checkBoxValueThree = false;
  bool isPasswordVisible = true;
  bool isFalse = true;
  bool isCorrect = false;
  @override
  void initState() {
    // TODO: implement initState
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();

    passwordController.addListener(() {
      if (passwordController.text.length > 6) {
        setState(() {
          isFalse = false;
          isCorrect = true;
        });
      } else {
        setState(() {
          isFalse = true;
          isCorrect = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInWithGoogleProvider = Provider.of<SocialSignInBloc>(context);

    var signUpScreenBloc =
        Provider.of<SignUpScreenBloc>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Stack(

                  children: [
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.height,
                            height: height * 0.5,
                            child: Container(
                                padding: EdgeInsets.only(top: 20),
                                color: Constants.orrangeColor,
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 40),
                                    height: height * 0.5,
                                    child: Text(
                                      'Get Registered into Rose Excellence',
                                      style: GoogleFonts.raleway(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    )))),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      margin: EdgeInsets.only(top: height * 0.15),
                      child: Column(
                        children: [
                          //  Align(alignment: Alignment.centerLeft,child: Text('Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: nameController,
                            style: GoogleFonts.raleway(),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Constants.orrangeColor,
                              ),
                              hintText: 'Name',
                              focusColor: AppColors.APP_BLUE,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.APP_BLUE),
                              ),
                            ),
                          ),
                          // Align(alignment: Alignment.centerLeft,child: Text('Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: GoogleFonts.raleway(),
                            controller: emailController,
                            validator: (value) {
                              if (!value!.contains('@')) {
                                return 'Please enter valid email address';
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Constants.orrangeColor,
                              ),
                              hintText: 'Email',
                              focusColor: AppColors.APP_BLUE,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.APP_BLUE),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Align(alignment: Alignment.centerLeft,child: Text('Phone Number',style: TextStyle(color: Colors.black),)),

                          //Align(alignment: Alignment.centerLeft,child: Text('Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: GoogleFonts.raleway(),
                            obscureText: isPasswordVisible,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password must be greater than 6 digits';
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: Constants.orrangeColor,
                              ),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Constants.orrangeColor,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.grey,
                                        )),
                              hintText: 'Enter password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.APP_BLUE),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          // Align(alignment: Alignment.centerLeft,child: Text('Confirm Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: GoogleFonts.raleway(),
                            obscureText: isPasswordVisible,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password must be greater than 6 digits';
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: Constants.orrangeColor,
                              ),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Constants.orrangeColor,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.grey,
                                        )),
                              hintText: 'Confirm password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.APP_BLUE),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor: AppColors.APP_BLUE,
                                        focusColor: AppColors.APP_BLUE,
                                        value: checkBoxValueOne,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValueOne = value!;
                                          });
                                        }),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return Initial(
                                                id: 'Terms & Conditions');
                                          },
                                        ));
                                      },
                                      child: Container(
                                        child: Text("Terms and Conditions",
                                            style: GoogleFonts.raleway(
                                                color: Constants.orrangeColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor: AppColors.APP_BLUE,
                                        focusColor: AppColors.APP_BLUE,
                                        value: checkBoxValueTwo,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValueTwo = value!;
                                          });
                                        }),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return Initial(id: 'Privacy Policy');
                                          },
                                        ));
                                      },
                                      child: Container(
                                        child: Text("Privacy Agreement",
                                            style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.bold,
                                                color: Constants.orrangeColor,
                                                fontSize: 14)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor: AppColors.DARK_GREEN,
                                        focusColor: AppColors.DARK_GREEN,
                                        value: checkBoxValueThree,
                                        hoverColor: AppColors.DARK_GREEN,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValueThree = value!;
                                          });
                                        }),
                                    Container(
                                      child: Text(
                                        "Email Marketing Consent",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                            color: Constants.orrangeColor,
                                            fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LoginOrSignUpPageButton(
                                  function: () {
                                    Navigator.pop(context);
                                  },
                                  width: 170,
                                  color: AppColors.APP_BLUE,
                                  height: 50,
                                  buttonText: 'Sign Up',
                                  buttonTextWidget: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.replay,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          'Go Back',
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textColor: Colors.white,
                                  borderColor: AppColors.APP_BLUE,
                                  backgroundColor: Constants.orrangeColor),
                              LoginOrSignUpPageButton(
                                  function: () {
                                    signUpScreenBloc.add(SignUpWithEmailAndPassword(
                                        userObject: Buyer(
                                      password: passwordController.text,
                                      name: nameController.text,
                                      email: emailController.text,
                                    )));
                                  },
                                  width: 170,
                                  color: AppColors.BUTTON_COLOR,
                                  height: 50,
                                  buttonText: 'Sign Up',
                                  buttonTextWidget: BlocConsumer<SignUpScreenBloc,
                                      SignUpScreenStates>(
                                    bloc: signUpScreenBloc,
                                    builder: (context, state) {
                                      if (state is SignUpScreenLoadingState) {
                                        return CircularProgressIndicator(
                                          color: Colors.white,
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                'Sign Up',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.forward_5,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        );
                                      }
                                    },
                                    listener: (context, state) {
                                      if (state is SignUpScreenLoadedState) {
                                        Navigator.of(context)
                                            .pushReplacement(CupertinoPageRoute(
                                          builder: (context) {
                                            return BottomNavigationScreen();
                                          },
                                        ));
                                      } else if (state is SignUpScreenErrorState) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(state.error)));
                                      }
                                    },
                                  ),
                                  textColor: Colors.white,
                                  borderColor: Constants.orrangeColor,
                                  backgroundColor: Constants.orrangeColor),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child:
                            GlobalWidgetsTwo.socialLoginButtons(   context, facebookFunction: () {
                              signInWithGoogleProvider.add(SignInWithFaceBookClickEvent());
                              print('facebookFunction');
                            }, googleFunction: () {
                              signInWithGoogleProvider.add(SignInWithGoogleClickEvent());
                              print('googleFunction');
                            }, appleFunction: () {
                              print('appleFunction');
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: GoogleFonts.raleway(
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(CupertinoPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ));
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                      color: Constants.orrangeColor),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            BlocConsumer<SocialSignInBloc, SocialSignInState>(
              builder: (context, state) {
                if (state is SigninLoadingState) {
                  return Center(child: CircularProgressIndicator(
                    color: Constants.orrangeColor,),);
                }
                else if (state is SigninErrorState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen(),)).then((value){
                    return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Constants.orrangeColor,
                        content: Text(state.error)));
                  });
                }
                return SizedBox();
              },
              listener: (context, state) {
                if (state is SigninLoadedState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen(),)).then((value){
                  });
                }
              },
            ),
          ],
        ));
  }
}
