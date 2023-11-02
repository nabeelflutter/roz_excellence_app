import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/screens/widgets.dart';

import '../../constants/app_colors/app_colors.dart';
import '../global_widgets/widgets/buttons.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  late TextEditingController descriptionController;
  @override
  void initState() {
    // TODO: implement initState
    descriptionController=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    descriptionController.dispose();
    super.dispose();
  }
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
    appBar:  AppBar(

        leading: IconButton(
          onPressed: () {
           Navigator.pop(context);

          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Constants.orrangeColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Support',
          style: TextStyle(color: Constants.orrangeColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [
          SizedBox(height: 20,),
          Text('Submit Query',style: GoogleFonts.raleway(color: Constants.orrangeColor,fontSize: 22),),
          SizedBox(height: 20,),

          Container(
            height: 400,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(8)),
            child: GlobalWidgetsTwo.TextAreaa(
                width, 'Write Here!',
                textEditingController: descriptionController),
          ),
          SizedBox(
            height: 100,
          ),

          Container(
            height: 60,
            child: LoginOrSignUpPageButton(backgroundColor: Constants.orrangeColor,
                function: () async{
                  setState(() {
                    isLoading=true;
                  });

                 DocumentSnapshot<Map<String,dynamic>> data=await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();

              await   FirebaseFirestore.instance.collection('Queries').doc().set(
                  {
                    'email' : data.data()!['email'],
                    'name' : data.data()!['name'],
                    'query' : descriptionController.text,
                  });

              setState(() {
                isLoading=false;
              });
              descriptionController.clear();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('We received your queries, we will get back shortly!')));

              },

                width: 300,
                color: Constants.orrangeColor,
                height: 60,
                buttonTextWidget:isLoading? Center(
                  child: Container(
                    height: 30,
                    width: 60,
                    child: LoadingIndicator(
                        indicatorType:
                        Indicator.ballPulse,

                        /// Required, The loading type of the widget
                        colors: [
                          Colors.black,
                          Colors.orange,
                          Colors.blueAccent,

                        ],

                        /// Optional, The color collections
                        strokeWidth: 2,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        backgroundColor:
                        Colors.transparent,

                        /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black

                      /// Optional, the stroke backgroundColor
                    ),
                  ),
                ) : Text('Send',style: GoogleFonts.raleway(color: Colors.white),),
                buttonText: 'Send',
                textColor: Colors.white,
                borderColor: Constants.orrangeColor),
          ),
          SizedBox(height: 20,),
        ],),),
      ),
    );
  }
}
