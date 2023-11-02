// ignore_for_file: sort_child_properties_last, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/screens/login_screen/login_screen.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../../view_model/forget_password_bloc/forget_password_bloc.dart';
import '../../../view_model/forget_password_bloc/forget_password_event.dart';
import '../../../view_model/forget_password_bloc/forget_password_state.dart';
import '../../../view_model/login_bloc/login_screen_states.dart';
import '../../global_widgets/global_widgets.dart';
import 'forget_password_behaviiour.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with ForgetPasswordBehaviour {
  @override
  void initState() {
    // TODO: implement initState
    initStateLogin();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposeLogin();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var bloc = context.read<ForgetPasswordBloc>();

    return SafeArea(
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: 100,
                    width: width,
                    child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.contain),
                  ),
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: width * 0.8,
                                      child: Text(
                                        'Enter your registered email to get reset password invitation',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            fontSize: 15),
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      style: GoogleFonts.raleway(
                                          color: Colors.black),
                                      controller: emailController,
                                      validator: (value) {
                                        if (!value!.contains('@')) {
                                          return 'Please enter valid email address';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.raleway(
                                            color: Colors.black),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Constants.orrangeColor,
                                        ),
                                        hintText: 'Email',
                                        focusColor: Colors.transparent,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  GlobalWidgets.MyButton(

                                      height: 50,
                                      width: width,
                                      text: BlocConsumer<ForgetPasswordBloc,
                                          ForgetPasswordScreenStates>(
                                        bloc: bloc,
                                        builder: (context, state) {
                                          if (state
                                              is ForgetPasswordScreenLoadingState) {
                                            return CircularProgressIndicator(
                                              color: Colors.white,
                                            );
                                          } else {
                                            return Text(
                                              'Verify',
                                              style: GoogleFonts.raleway(
                                                  color:Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            );
                                          }
                                        },
                                        listener: (context, state) {
                                          if (state
                                              is ForgetPasswordScreenLoadedState) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    CupertinoPageRoute(
                                              builder: (context) {
                                                return LoginScreen();
                                              },
                                            ));
                                          } else if (state
                                              is ForgetPasswordScreenErrorState) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                              state.error,
                                              style: GoogleFonts.raleway(),
                                            )));
                                          }
                                        },
                                      ),
                                      bgColor: Constants.orrangeColor,
                                      onTap: () {
                                        bloc.add(SendEmailEvent(
                                          email: emailController.text,
                                        ));
                                      }),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
