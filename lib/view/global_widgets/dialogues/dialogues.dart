import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rose_excellence/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/constants/constant.dart';
import '../../../view_model/login_bloc/login_screen_bloc.dart';
import '../../../view_model/login_bloc/login_screen_events.dart';
import '../../../view_model/login_bloc/login_screen_states.dart';

import '../../screens/forget_password/forget_password.dart';
import '../../screens/sign_up_screen/signup_screen.dart';
import '../global_widgets.dart';
import '../widgets/buttons.dart';
import '../widgets/textfields.dart';

class GeneralDialogues {
  static Future showLoginDialogue(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialogBox(
          title: 'title',
          descriptions: 'descriptions',
          text: 'text',
        );
      },
    );
  }

  static Future deleteDialogue(
      {required BuildContext context,
      required String message,
      required void Function() postiveButtonOnClick,
      Widget? widget,
      required void Function() negativeButtonOnClick}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.DARK_GREEN, width: 2)),
          child: DeleteDialogue(
            widget: widget ?? Text('Yes'),
            negativeButtonOnClick: negativeButtonOnClick,
            message: message,
            positiveButtonOnClick: postiveButtonOnClick,
          ),
        );
      },
    );
  }
}

class DeleteDialogue extends StatefulWidget {
  String message;
  void Function() positiveButtonOnClick;
  void Function() negativeButtonOnClick;
  Widget? widget;
  DeleteDialogue(
      {required this.negativeButtonOnClick,
      required this.message,
      required this.positiveButtonOnClick,
      this.widget,
      Key? key})
      : super(key: key);

  @override
  State<DeleteDialogue> createState() => _DeleteDialogueState();
}

class _DeleteDialogueState extends State<DeleteDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaY: 2.0, tileMode: TileMode.clamp, sigmaX: 2.0),
          child: FittedBox(
              fit: BoxFit.cover,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                        child: Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                  ),
                  Row(
                    children: [
                      GlobalWidgets.CustomButton(
                          height: 40,
                          width: 100,
                          context: context,
                          text: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          customOnTap: widget.positiveButtonOnClick,
                          color: Colors.blue),
                      SizedBox(
                        width: 10,
                      ),
                      GlobalWidgets.CustomButton(
                          height: 40,
                          width: 100,
                          context: context,
                          text: widget.widget ??
                              Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                          customOnTap: widget.negativeButtonOnClick,
                          color: Colors.red)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  bool isPasswordVisible = true;
  LoginScreenBloc loginBloc = LoginScreenBloc(LoginScreenInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500, minWidth: 300),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  left: Constants.padding,
                  top: Constants.avatarRadius + Constants.padding,
                  right: Constants.padding,
                  bottom: Constants.padding),
              margin: EdgeInsets.only(top: Constants.avatarRadius),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.padding),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: GoogleFonts.raleway(
                            color: AppColors.DARK_GREEN, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                        MediaQuery.of(context).size.width, 'Username or Email',
                        textEditingController: emailController),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          color: Colors.white,
                          child: TextFormField(
                              validator: (value) {},
                              obscureText: isPasswordVisible,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {},
                                      child: isPasswordVisible
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(
                                              Icons.remove_red_eye_outlined)),
                                  /*prefixIcon: prefixIconUrl==null? Container() : Image(image: AssetImage(prefixIconUrl),),
              suffixIcon: suffixIconUrl==null? Container() :Image(image: AssetImage(suffixIconUrl),),*/
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: Constants.randomTextColor),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.DARK_GREEN,
                                        width: 2,
                                        style: BorderStyle.solid),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.3))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.DARK_GREEN,
                                          width: 2)))),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginOrSignUpPageButton(
                        function: () {
                          loginBloc.add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceView(),));
                        },
                        /*async {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CHP(serviceViewOrServiceViewScreen: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceView(),));
                          }),));
                        },*/
                        width: MediaQuery.of(context).size.width,
                        color: Constants.orrangeColor,
                        height: 40,
                        buttonText: 'Login',
                        buttonTextWidget:
                            BlocConsumer<LoginScreenBloc, LoginScreenStates>(
                          bloc: loginBloc,
                          builder: (context, state) {
                            if (state is LoginScreenLoadingState) {
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
                            } else {
                              return Text(
                                'Login',
                                style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          },
                          listener: (context, state) {
                            if (state is LoginScreenLoadedState) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => BottomNavigationScreen(),
                              ));
                            } else if (state is LoginScreenErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)));
                            }
                          },
                        ),
                        textColor: Colors.white,
                        borderColor: Constants.borderColor,
                        backgroundColor: Colors.grey),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Don\'t have an account?",
                            style: TextStyle(color: Constants.randomTextColor),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
