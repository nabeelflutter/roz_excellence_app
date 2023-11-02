import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rose_excellence/view/screens/splash_screen/splash_screen.dart';
import 'package:rose_excellence/view_model/forget_password_bloc/forget_password_bloc.dart';
import 'package:rose_excellence/view_model/forget_password_bloc/forget_password_state.dart';
import 'package:rose_excellence/view_model/login_bloc/login_screen_bloc.dart';
import 'package:rose_excellence/view_model/login_bloc/login_screen_states.dart';
import 'package:rose_excellence/view_model/signup_bloc/signup_bloc.dart';
import 'package:rose_excellence/view_model/signup_bloc/signup_state.dart';
import 'package:rose_excellence/view_model/social_sign_in_bloc/signin_with_google_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return SignUpScreenBloc(SignUpScreenInitialState());
            },
          ),
          BlocProvider(
            create: (context) {
              return LoginScreenBloc(LoginScreenInitialState());
            },
          ),
          BlocProvider(
            create: (context) {
              return ForgetPasswordBloc(ForgetPasswordScreenInitialState());
            },
          ),
          BlocProvider(create: (context) => SocialSignInBloc(),),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
