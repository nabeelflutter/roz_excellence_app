import 'package:flutter/material.dart';

import '../../../../constants/constants/constant.dart';
import 'package:flutter/cupertino.dart';

import '../../screens/login_screen/login_screen.dart';



class SimpleLoginDialogue extends StatefulWidget {
  final String firstNote,secondNote;

   SimpleLoginDialogue(
      {Key? key,
        required this.firstNote,
        required this.secondNote
      })
      : super(key: key);

  @override
  _SimpleLoginDialogueState createState() => _SimpleLoginDialogueState();
}

class _SimpleLoginDialogueState extends State<SimpleLoginDialogue> {
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
    return Stack(
      children: <Widget>[
        Container(
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
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Container(
            padding: EdgeInsets.only(top: 10,bottom: 30, left: 15,right: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                  GestureDetector(onTap: (){
                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginScreen(),));
                    },child: Container(child: Text(widget.firstNote,style: TextStyle(fontSize: 16,color: Constants.orrangeColor),),)),
                  SizedBox(width: 5,),
                  Container(child: Text(widget.secondNote,style: TextStyle(fontSize: 16),),),

                ],),)
              ],
            ),
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child:
                Image.asset('assets/images/logo.png')),
          ),
        ),
      ],
    );
  }
  // contentBox(context) {
  //   return Stack(
  //     children: <Widget>[
  //       Container(
  //         padding: EdgeInsets.only(
  //             left: Constants.padding,
  //             top: Constants.avatarRadius + Constants.padding,
  //             right: Constants.padding,
  //             bottom: Constants.padding),
  //         margin: EdgeInsets.only(top: Constants.avatarRadius),
  //         decoration: BoxDecoration(
  //             shape: BoxShape.rectangle,
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(Constants.padding),
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
  //             ]),
  //         child: Container(
  //           padding: EdgeInsets.only(top: 10,bottom: 30, left: 15,right: 15),
  //           width: MediaQuery.of(context).size.width,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               Center(child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
  //                 GestureDetector(onTap: (){
  //                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  //                 },child: Container(child: Text(widget.firstNote,style: TextStyle(fontSize: 16,color: Constants.orrangeColor),),)),
  //                 SizedBox(width: 5,),
  //                 Container(child: Text(widget.secondNote,style: TextStyle(fontSize: 16),),),
  //
  //               ],),)
  //             ],
  //           ),
  //         ),
  //       ),
  //       Positioned(
  //         left: Constants.padding,
  //         right: Constants.padding,
  //         child: CircleAvatar(
  //           backgroundColor: Colors.transparent,
  //           radius: Constants.avatarRadius,
  //           child: ClipRRect(
  //               borderRadius:
  //               BorderRadius.all(Radius.circular(Constants.avatarRadius)),
  //               child:
  //               Image.asset('assets/images/logo.png')),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
