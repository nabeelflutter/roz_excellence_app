
import 'package:flutter/material.dart';
import 'package:rose_excellence/view/screens/splash_screen/splash_screen_behaviour.dart';
import 'package:rose_excellence/view/screens/splash_screen/widgets/splash_widget.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenBehaviour{

  @override
  void initState() {
    // TODO: implement initState
    navigateToTheOtherScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(padding: EdgeInsets.symmetric(horizontal: 40),child: SplashWidget()),
    );
  }
}
