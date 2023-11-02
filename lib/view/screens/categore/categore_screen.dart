// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rose_excellence/constants/app_colors/app_colors.dart';
import 'package:rose_excellence/models/faveriout_modal.dart';
import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
import 'package:rose_excellence/view/screens/faveriout/widget/faveriout_widget.dart';

import '../../../generated/assets.dart';

class CategoreScreen extends StatelessWidget {
  CategoreScreen({super.key});

  List<FaverioutModal> faverioutList = [
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
    FaverioutModal(
        image: Assets.imagesTablet, title: "Saiko Brows", price: "Sub Title"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: MyTextWidget(
          text: "My Courses",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textColor: AppColors.BLACK_COLOR,
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.APP_BLUE.withOpacity(0.3),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout_sharp,
                  color: Colors.grey,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 7),
            child: CircleAvatar(
              backgroundColor: AppColors.APP_BLUE.withOpacity(0.3),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
          )
        ],
      ),
      body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: GridView.builder(
              itemCount: faverioutList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 20, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return FaverioutContainer(modal: faverioutList[index]);
              },
            ),
          )),
    );
  }
}
