// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/generated/assets.dart';
import 'package:rose_excellence/view/global_widgets/bottom_bar_widget.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/global_widgets/widgets/textfields.dart';
import 'package:rose_excellence/view/screens/Explore/widget/explore_screen_widget.dart';
import 'package:rose_excellence/view/screens/post/post_behaviour.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> with PostBehaviour {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  File? imageFile;
  void setImage(File? image) {
    imageFile = image;
  }

  Future<void> pickImage(ImageSource source) async {
    var pick = await ImagePicker().pickImage(source: source);
    if (pick != null) {
      setImage(File(pick.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        elevation: 0,
          backgroundColor: AppColors.BUTTON_COLOR,
          titleSpacing: -width * 0.02,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Constants.orrangeColor),
          ),
          title: MyTextWidget(
            text: "Create Post",
            fontWeight: FontWeight.bold,
            textColor: Constants.orrangeColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyOutLineButton(
                borderColor: Constants.orrangeColor,
                followText: "Post",
                textSize: 14,
                height: height * 0.03,
                width: width * 0.2,
                textColor: Colors.white,
              ),
            )
          ]),
      body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.035,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: height * 0.04,
                          backgroundColor: AppColors.BUTTON_COLOR,
                          backgroundImage: AssetImage(Assets.imagesTablet),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextWidget(
                              text: "Shahroz Khalid",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.BLACK_COLOR,
                            ),
                            MyTextWidget(
                              text: "Saiko Brows",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    MyTextField(
                      hint: "Share with Community",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width,
                height: height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageFile == null
                            ? Assets.imagesDummy
                            : FileImage(imageFile!).toString()),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    context: context,
                    builder: (context) {
                      return MyBottomheet(
                        cameraClick: () {
                          pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        galleryClick: () {
                          pickImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                      );
                    },
                  );
                },
                child: Container(
                    width: width,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Constants.orrangeColor, width: 1)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Icon(
                          Icons.photo_library,
                          color: Constants.orrangeColor,
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        MyTextWidget(
                          text: "Photo/video",
                          textColor: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
