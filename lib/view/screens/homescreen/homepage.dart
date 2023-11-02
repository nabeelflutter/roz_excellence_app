import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/global_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: InkWell(
            onTap: (){
              _signOut().then((value) {
                Navigator.pop(context);
              });
            },
            child: MyTextWidget(
              text: "Home",
            ),
          ),
        ),
      ),
    );
  }
}
