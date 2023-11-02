// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:rose_excellence/view/screens/forget_password/forget_password.dart';
import 'package:rose_excellence/view/screens/homescreen/homepage.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../view_model/login_bloc/login_screen_bloc.dart';
import '../../../view_model/login_bloc/login_screen_events.dart';
import '../../../view_model/login_bloc/login_screen_states.dart';
import '../../../view_model/social_sign_in_bloc/signin_with_google_bloc.dart';
import '../../global_widgets/widgets/buttons.dart';
import '../login_or_signup_screen/login_or_sign_up_screen.dart';
import '../sign_up_screen/signup_screen.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  bool? isFromHomepage;

  LoginScreen({this.isFromHomepage, Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenBloc loginBloc = LoginScreenBloc(LoginScreenInitialState());
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isFalse = true;
  bool isCorrect = false;

  @override
  void initState() {
    // TODO: implement initState
    passwordController = TextEditingController();
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
  Widget build(BuildContext context) {
    final signInWithGoogleProvider = Provider.of<SocialSignInBloc>(context);

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) {
            return LoginOrSignUpScreen();
          },
        ));
        return Future.delayed(const Duration(microseconds: 1));
      },
      child: Scaffold(
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
          resizeToAvoidBottomInset: false,
          //backgroundColor: Colors.red,
          body: Stack(
            children: [
              SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Container(
                    color: Colors.white.withOpacity(0.95),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: height * 0.3,
                            alignment: Alignment.center,
                            width: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.cover,)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  height: height * 0.4,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Form(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: AppColors.DARK_GREEN
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: TextFormField(
                                                  keyboardType:
                                                  TextInputType.emailAddress,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  controller: emailController,
                                                  validator: (value) {
                                                    if (!value!.contains('@')) {
                                                      return 'Please enter valid email address';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                    TextStyle(
                                                        color: Colors.black),
                                                    border: InputBorder.none,
                                                    prefixIcon: Icon(
                                                      Icons.email,
                                                      color: Constants
                                                          .orrangeColor,
                                                    ),
                                                    hintText: 'Email',
                                                    focusColor: Colors
                                                        .transparent,
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    color: AppColors.DARK_GREEN
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  obscureText: isPasswordVisible,
                                                  controller: passwordController,
                                                  validator: (value) {
                                                    if (value!.length < 6) {
                                                      return 'Password must be greater than 6 digits';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                    TextStyle(
                                                        color: Colors.black),
                                                    border: InputBorder.none,
                                                    prefixIcon: Icon(
                                                      Icons.password,
                                                      color: Constants
                                                          .orrangeColor,
                                                    ),
                                                    suffixIcon: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isPasswordVisible =
                                                            !isPasswordVisible;
                                                          });
                                                        },
                                                        child: isPasswordVisible
                                                            ? Icon(
                                                          Icons.remove_red_eye,
                                                          color: Constants
                                                              .orrangeColor,
                                                        )
                                                            : Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: Colors.blue,
                                                        )),
                                                    hintText: 'Enter password',
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .APP_BLUE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(CupertinoPageRoute(
                                          builder: (context) =>
                                              ForgetPassword(),
                                        ));
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        // padding: EdgeInsets.all(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Constants.orrangeColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    LoginOrSignUpPageButton(
                                        function: () async {
                                          loginBloc.add(LoginEvent(
                                              email: emailController.text,
                                              password: passwordController
                                                  .text));
                                        },
                                        width: 400,
                                        color: AppColors.APP_BLUE,
                                        height: 50,
                                        buttonText: 'Login',
                                        buttonTextWidget: BlocConsumer<
                                            LoginScreenBloc,
                                            LoginScreenStates>(
                                          bloc: loginBloc,
                                          builder: (context, state) {
                                            if (state is LoginScreenLoadingState) {
                                              return Center(
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 60,
                                                  child: LoadingIndicator(
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
                                            } else {
                                              return Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              );
                                            }
                                          },
                                          listener: (context, state) {
                                            if (state is LoginScreenLoadedState) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return BottomNavigationScreen();
                                                    },
                                                  ));
                                            } else if (state
                                            is LoginScreenErrorState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(state.error)));
                                            }
                                          },
                                        ),
                                        textColor: AppColors.APP_BLUE,
                                        borderColor: AppColors.APP_BLUE,
                                        backgroundColor: Constants
                                            .orrangeColor),
                                  ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child:
                                  GlobalWidgetsTwo.socialLoginButtons(
                                      context, facebookFunction: () {
                                    signInWithGoogleProvider.add(SignInWithFaceBookClickEvent());
                                    print('facebookFunction');
                                  }, googleFunction: () {
                                    signInWithGoogleProvider.add(SignInWithGoogleClickEvent());
                                    print('googleFunction');
                                  }, appleFunction: () {
                                    print('appleFunction');
                                  }
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.2,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(
                                          "Don't have an account?",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                CupertinoPageRoute(
                                                  builder: (context) {
                                                    return SignUpScreen();
                                                  },
                                                ));
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Constants.orrangeColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
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
          )),
    );
  }
}
