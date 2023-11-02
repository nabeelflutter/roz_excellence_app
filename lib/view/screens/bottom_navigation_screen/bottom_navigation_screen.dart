// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rose_excellence/constants/constants/constant.dart';

import 'package:rose_excellence/view/screens/Explore/explorepage.dart';
import 'package:rose_excellence/view/screens/faveriout/faveriout_screen.dart';
import 'package:rose_excellence/view/screens/settings_and_privacy/settings_and_privacy.dart';

import '../homescreen/homepage.dart';
import '../journal_screen/journal_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Course(),
    FaverioutScreen(),
    Explorepage(),
    SettingsAndProfileScreen(),
  ];

  // final List<String> titleList = [
  //   'assets/new_onboarding_assets/menu.png',
  //   'assets/new_onboarding_assets/journal.png',
  //   'assets/new_onboarding_assets/profil.png',
  //   'assets/new_onboarding_assets/profil.png',
  // ];
  bool isBookSelected = true;
  bool isProfileSelected = false;
  bool isExploreSelect = false;
  bool isFaverioutSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar:
          //  ClipRRect(
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(20.0),
          //     topRight: Radius.circular(20.0),
          //   ),
          //   child: Container(
          //     color: Colors.white,
          //     height: 100,
          //     child: Theme(
          //       data: Theme.of(context).copyWith(
          //           // sets the background color of the `BottomNavigationBar`
          //           canvasColor: Colors.black,
          //           // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          //           primaryColor: Colors.white,
          //           textTheme: Theme.of(context).textTheme.copyWith(
          //               caption: GoogleFonts.raleway(color: Colors.yellow))),
          //       child:
          BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;

            if (_currentIndex == 0) {
              isBookSelected = true;
              isFaverioutSelect = false;
              isExploreSelect = false;
              isProfileSelected = false;
            } else if (_currentIndex == 1) {
              isBookSelected = false;
              isFaverioutSelect = true;
              isExploreSelect = false;
              isProfileSelected = false;
            } else if (_currentIndex == 2) {
              isBookSelected = false;
              isFaverioutSelect = false;
              isExploreSelect = true;
              isProfileSelected = false;
            } else if (_currentIndex == 3) {
              isBookSelected = false;
              isFaverioutSelect = false;
              isExploreSelect = false;
              isProfileSelected = true;
            }
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/book_one.svg',
              color: isBookSelected == true ? Constants.orrangeColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: isFaverioutSelect == true ? Constants.orrangeColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              //  'assets/images/profile_icon.svg',
              Icons.chat_bubble_outline_sharp,
              color: isExploreSelect == true ? Constants.orrangeColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/profile_icon.svg',
              color: isProfileSelected == true ? Constants.orrangeColor : Colors.black,
            ),
            label: '',
          ),
        ],
      ),
    );
    //     ),
    //   ),
    // );
  }
}
