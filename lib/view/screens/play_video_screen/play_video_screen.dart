import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../global_widgets/global_widgets.dart';

class PlayVideoScreen extends StatefulWidget {
  String? videoPath, videoTitle, videoSubTitle;

  PlayVideoScreen({Key? key, required this.videoPath, required this.videoSubTitle, required this.videoTitle})
      : super(key: key);

  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late VideoPlayerController _controller;
  ChewieController? chewicController;

  Future<void> loadVideoPlayer() async {
    _controller = VideoPlayerController.contentUri(Uri.parse(
        widget.videoPath.toString()));

    Future.wait([_controller!.initialize()]);

    chewicController = ChewieController(
        fullScreenByDefault: true,

        videoPlayerController: _controller, autoPlay: false, looping: false);
  }
  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  Duration? videoLength;
  Duration? videoPosition;
  double volume = 0.5;
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    chewicController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body:  Container(
          width: double.infinity,
          height: double.infinity,
          child: chewicController != null
              ? Chewie(

              controller: chewicController!)
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              MyTextWidget(
                text: "Loading",
              )
            ],
          ),
        ),
        // body: RotatedBox(
        //   quarterTurns: 1, // Rotate to landscape mode
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: <Widget>[
        //         if (_controller!.value.isInitialized) ...<Widget>[
        //           AspectRatio(
        //             aspectRatio: _controller!.value.aspectRatio,
        //             child: VideoPlayer(_controller!),
        //           ),
        //           VideoProgressIndicator(
        //             _controller!,
        //             allowScrubbing: true,
        //             padding: const EdgeInsets.all(10),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 50),
        //             child: Row(
        //               children: <Widget>[
        //                 IconButton(
        //                   icon: Icon(_controller!.value.isPlaying
        //                       ? Icons.pause
        //                       : Icons.play_arrow),
        //                   onPressed: () {
        //                     setState(() {
        //                       _controller!.value.isPlaying
        //                           ? _controller!.pause()
        //                           : _controller!.play();
        //                     });
        //                   },
        //                 ),
        //                 Text(
        //                     '${convertToMinutesSeconds(videoPosition!)} / ${convertToMinutesSeconds(videoLength!)}'),
        //
        //                 Icon(animatedVolumeIcon(volume)),
        //                 SizedBox(
        //                   width: 150,
        //                   child: Slider(
        //                     value: volume,
        //                     min: 0,
        //                     max: 1,
        //                     onChanged: (_volume) => setState(() {
        //                       volume = _volume;
        //                       _controller!.setVolume(_volume);
        //                     }),
        //                   ),
        //                 ),
        //                 const Spacer(),
        //                 IconButton(
        //                   icon: Icon(
        //                     Icons.loop,
        //                     color: _controller!.value.isLooping
        //                         ? Colors.green
        //                         : Colors.black,
        //                   ),
        //                   onPressed: () {
        //                     setState(() {
        //                       _controller!
        //                           .setLooping(!_controller!.value.isLooping);
        //                     });
        //                   },
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 70),
        //             child: Align(
        //               alignment: Alignment.topLeft,
        //               child: Text(
        //                 widget.videoTitle.toString(),
        //                 style: const TextStyle(
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 20),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 70),
        //             child: Align(
        //               alignment: Alignment.topLeft,
        //               child: Text(
        //                 widget.videoTitle.toString(),
        //                 style: const TextStyle(color: Colors.grey),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(height: 20,)
        //         ],
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
  seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}
