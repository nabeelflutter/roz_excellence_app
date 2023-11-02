import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rose_excellence/constants/constants/constant.dart';

class TextScreen extends StatefulWidget {
  String id;
   TextScreen({required this.id,Key? key}) : super(key: key);

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,body: SingleChildScrollView(child: Container(padding: EdgeInsets.all(10),child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(future: FirebaseFirestore.instance.collection(widget.id).get(),builder: (context, snapshot) {
      if(snapshot.hasData && snapshot.data!=null && snapshot.data!.docs.isNotEmpty){
        return Center(child: Text('${snapshot.data!.docs[0]['${widget.id}']}',style: GoogleFonts.raleway(color: Colors.black,fontSize: 18)),);
      }
      else if(snapshot.data!=null && snapshot.data!.docs.isEmpty){
        return Center(
          child: Text('We Are under update!')
        );
      }

      else{
        return Center(
          child: Container(
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
                pathBackgroundColor: Colors.black

              /// Optional, the stroke backgroundColor
            ),
          ),
        );
      }
    },),),),appBar: AppBar(

      centerTitle: true,
     title: Text('${widget.id}',style: TextStyle(color: Constants.orrangeColor),),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Constants.orrangeColor,
          )),
    ),);
  }
}
