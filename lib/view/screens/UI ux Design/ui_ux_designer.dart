// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UIUXDesignerScreen extends StatefulWidget {
  const UIUXDesignerScreen({super.key});

  @override
  State<UIUXDesignerScreen> createState() => _UIUXDesignerScreenState();
}

class _UIUXDesignerScreenState extends State<UIUXDesignerScreen> {
  // final videoURL =
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  // late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   final videoId = YoutubePlayer.convertUrlToId(videoURL);
  //   _controller = YoutubePlayerController(
  //       initialVideoId: videoId!, flags: YoutubePlayerFlags(autoPlay: true));
  // }
  late VideoPlayerController _controller;
  late Future<void> initialVideoPlayer;
  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _controller = VideoPlayerController.contentUri(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
    initialVideoPlayer = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    // ..initialize().then((_) {
    //   setState(() {});
    //   super.initState();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: FutureBuilder(
              future: initialVideoPlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          // Positioned(child:  IconButton(
          //                   onPressed: () {
          //                     setState(() {
          //                       if (_controller.value.isPlaying) {
          //                         _controller.pause();
          //                       } else {
          //                         _controller.play();
          //                       }
          //                     });
          //                   },
          //                   icon: Icon(
          //                     _controller.value.isPlaying
          //                         ? Icons.pause
          //                         : Icons.play_arrow,
          //                     size: height * 0.05,
          //                     color: Colors.white,
          //                   )),)
        ]),
      ),
    );
  }
}




// // ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:rose_excellence/constants/app_colors/app_colors.dart';
// import 'package:rose_excellence/constants/constants/constant.dart';
// import 'package:rose_excellence/generated/assets.dart';
// import 'package:rose_excellence/models/ui_ux_model.dart';
// import 'package:rose_excellence/view/global_widgets/global_widgets.dart';
// import 'package:video_player/video_player.dart';

// import 'widget/ui_ux_widget.dart';

// class UIUXDesignerScreen extends StatefulWidget {
//   UIUXDesignerScreen({super.key});

//   @override
//   State<UIUXDesignerScreen> createState() => _UIUXDesignerScreenState();
// }

// class _UIUXDesignerScreenState extends State<UIUXDesignerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> initialVideoPlayer;
//   @override
//   void initState() {
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
//     initialVideoPlayer = _controller.initialize();
//     _controller.setLooping(true);
//     // ..initialize().then((_) {
//     //   setState(() {});
//     //   super.initState();
//     // });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   List<UIUXModal> uiList = [
//     UIUXModal(
//         image: Assets.imagesTablet,
//         time: "5 mint",
//         subTitle: "UI/UX/Designer",
//         title: "1 - Intro to Typography"),
//     UIUXModal(
//         image: Assets.imagesTablet,
//         time: "6 minut",
//         subTitle: "UI/UX/Designer",
//         title: "2 -Font Pairing"),
//     UIUXModal(
//         image: Assets.imagesTablet,
//         time: "7 mint",
//         subTitle: "UI/UX/Designer",
//         title: "3 - Styling Typography"),
//     UIUXModal(
//         image: Assets.imagesTablet,
//         time: "9 mint",
//         subTitle: "UI/UX/Designer",
//         title: "1 - Intro to Typography"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var width = size.width;
//     var height = size.height;
//     return Scaffold(
//       body: Container(
//         width: width,
//         height: height,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.45,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           width: width,
//                           height: height * 0.3,
//                           color: Constants.orrangeColor,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: height * 0.04,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(height * 0.01),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor:
//                                           Colors.white.withOpacity(0.15),
//                                       child: Center(
//                                         child: IconButton(
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                             icon: Icon(
//                                               Icons.arrow_back,
//                                               color: AppColors.BUTTON_COLOR,
//                                             )),
//                                       ),
//                                     ),
//                                     MyTextWidget(
//                                       text: "UI/UX Design",
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       textColor: AppColors.BUTTON_COLOR,
//                                     ),
//                                     MyTextWidget(
//                                       text: "",
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 20,
//                         top: 100,
//                         right: 20,
                    //  child: FutureBuilder(
                    //       future: initialVideoPlayer,
                    //       builder: (context, snapshot) {
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.done) {
                    //           return AspectRatio(
                    //             aspectRatio: _controller.value.aspectRatio,
                    //             child: VideoPlayer(_controller),
                    //           );
                    //         } else {
                    //           return Center(child: CircularProgressIndicator());
                    //         }
                    //       },
                    //     ),
                    //   ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: height * 0.25,
//                         child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (_controller.value.isPlaying) {
//                                   _controller.pause();
//                                 } else {
//                                   _controller.play();
//                                 }
//                               });
//                             },
//                             icon: Icon(
//                               _controller.value.isPlaying
//                                   ? Icons.pause
//                                   : Icons.play_arrow,
//                               size: height * 0.05,
//                               color: Colors.white,
//                             )),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: width * 0.03, right: width * 0.03, top: height * 0.01),
//               child: SizedBox(
//                 width: width,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MyTextWidget(
//                       text: "1 - Intro to Typography",
//                       textColor: Constants.orrangeColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                     SizedBox(
//                       height: height * 0.005,
//                     ),
//                     MyTextWidget(
//                       text: "Typography for UI/UX",
//                       textColor: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.04,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MyTextWidget(
//                     onClick: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                     text: "Description",
//                     textColor: Constants.orrangeColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(
//                     height: height * 0.01,
//                   ),
//                   MyTextWidget(
//                     textColor: Colors.black,
//                     text:
//                         '''Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.''',
//                   ),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   // Divider(
//                   //   color: AppColors.APP_BLUE,
//                   //   height: 2,
//                   //   thickness: 1.1,
//                   // )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: uiList.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(
//                       left: width * 0.03,
//                       right: width * 0.03,
//                     ),
//                     child: MyListTile(modal: uiList[index]),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
