// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/global_widgets/widgets/textfields.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';

class AddWorkScreen extends StatefulWidget {
  AddWorkScreen({super.key,required this.lessonId,required this.courseId});
   String courseId;
   String lessonId;
  List<AddImageModal> list = [
    AddImageModal(image: Assets.imagesTablet),
    AddImageModal(image: Assets.imagesTablet)
  ];

  @override
  State<AddWorkScreen> createState() => _AddWorkScreenState();
}

class _AddWorkScreenState extends State<AddWorkScreen> {
  File? pickImage;

  void setImage(File? value) {
    setState(() {
      pickImage = value;
    });
  }

  Future<void> myImagePick(ImageSource sourse) async {
    var image = await ImagePicker().pickImage(source: sourse);
    if (image != null) {
      setImage(File(image.path));
    }
  }
  List<dynamic> questionsList = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BUTTON_COLOR,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
               InkWell(
                 onTap: (){
                   myImagePick(ImageSource.gallery);
                 },
                 child: Container(
                   height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey)
                   ),
                   child: pickImage != null ?Center(child: Icon(Icons.done,size: 50,),):Center(child: Icon(Icons.add),),
                 ),
               ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height*.30,
                child:  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Assignments').doc(widget.courseId).collection('Assignments').doc(widget.lessonId).snapshots(),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text('Something went wrong'),);
                      }
                      var questionsData = snapshot.data!.data()!['questions'];
                      questionsList = List<dynamic>.from(questionsData);
                      return ListView.builder(
                        itemCount: questionsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Align(
                                    alignment:Alignment.topLeft,
                                    child: MyTextWidget(
                                      text: questionsList[index].toString(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.023,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Write Your Ans',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)

                                      ),
                                      disabledBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)

                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },);
                    }
                ),),
              // SizedBox(
              //   width: width,
              //   height: height * 0.13,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: widget.list.length,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.only(left: width * 0.03),
              //         child: AddImage(modal: widget.list[index]),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: height * 0.06,
              ),
              // Padding(
              //   padding:
              //       EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       MyTextWidget(
              //         text: "Add Description",
              //         fontWeight: FontWeight.bold,
              //         fontSize: height * 0.022,
              //         textColor: AppColors.BLACK_COLOR,
              //       ),
              //       SizedBox(
              //         height: height * 0.01,
              //       ),
              //       CustomTextField(width, "type......", maxKine: 7)
              //     ],
              //   ),
              // ),
              SizedBox(
                height: height * 0.1,
              ),
              MyOutLineButton(
                onClick: () {},
                width: width * 0.7,
                height: height * 0.065,
                followText: "Send",
                textColor: AppColors.BUTTON_COLOR,
                textSize: height * 0.027,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  AddImage({super.key, required this.modal});
  final AddImageModal modal;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Container(
      width: width * 0.25,
      height: height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(modal.image!), fit: BoxFit.fill)),
    );
  }
}

class AddImageModal {
  String? image;
  File? fileImage;
  AddImageModal({this.image, this.fileImage});
}
