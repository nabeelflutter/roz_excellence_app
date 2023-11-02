import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget ChatRow(double width,BuildContext context){
  return GestureDetector(
    onTap: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatViewScreen(),));
    },
    child: Container(
      height: 65,
      width: width,
      padding: EdgeInsets.only(top: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(1,0)
          )]),margin: EdgeInsets.only(left: 10),padding: EdgeInsets.only(left: 10,right: 10),width: width*0.8,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(child: Text('Alina Finiti',style: TextStyle(fontSize: 16,color: Colors.black),),),
                      SizedBox(height: 5,),
                      Container(child: Text('So any plans this weekend?',style: TextStyle(color: Colors.black54,fontSize: 12),),),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(child: Text('03:46 PM',style: TextStyle(color: Colors.black54,fontSize: 12),),),
                    SizedBox(height: 20,),

                    //Container(child: Image(image: AssetImage('assets/images/read_tick.png'),),),
                  ],
                )
              ],),
          ),          Container(margin: EdgeInsets.all(8),child: CircleAvatar(child: Image(image: AssetImage('assets/images/usertwo.png'),)),),

        ],
      ),
    ),
  );
}