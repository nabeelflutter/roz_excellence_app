import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../constants/app_colors/app_colors.dart';

class Supports extends StatefulWidget {
  const Supports({Key? key}) : super(key: key);

  @override
  State<Supports> createState() => _SupportsState();
}

class _SupportsState extends State<Supports> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * .4,
            color: AppColors.DARK_GREEN,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * .05),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Support',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * .2,
                  width: widht * .7,
                  decoration: BoxDecoration(
                      color: AppColors.DARK_GREEN,
                      image: DecorationImage(
                          image: AssetImage('assets/images/help.png'))),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .35),
            child: Container(
              height: height,
              width: widht,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * .012),
                    child: Text(
                      'Tell us How we can help',
                      style: TextStyle(
                          color: AppColors.APP_BLUE,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),

                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: height * .13,
                      width: widht,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: widht*.03),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Icon(Icons.report,color: Colors.white,),
                              decoration: BoxDecoration(

                                  color: AppColors.APP_BLUE,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Report Bug',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: widht*.03),
                                    child: Text('Get Solutions beamed to your inbox',
                                        style: TextStyle(
                                            color: AppColors.APP_BLUE,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
             GestureDetector(
                    onTap: (){

                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(

                        height: height * .13,
                        width: widht ,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: widht*.03),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: Icon(Icons.query_builder,color: Colors.white,),
                                decoration: BoxDecoration(

                                    color: AppColors.APP_BLUE,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Submit Query',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: widht*.03),
                                    child: Text('Get Solutions beamed to your inbox',
                                        style: TextStyle(
                                            color: AppColors.APP_BLUE,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
