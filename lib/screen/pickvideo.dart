// import 'dart:io' show File;

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

// class pickVideo extends StatefulWidget {
//   const pickVideo({Key? key}) : super(key: key);

//   @override
//   State<pickVideo> createState() => _pickVideoState();
// }

// class _pickVideoState extends State<pickVideo> {
//   XFile? video;
//   late File _video;
//   late VideoPlayerController _videoPlayerController;
//   _pickVideo() async {
//     final ImagePicker _picker = ImagePicker();
//     video = await _picker.pickVideo(source: ImageSource.gallery);

//     _videoPlayerController = VideoPlayerController.file(video as File)
//       ..initialize().then((value) {
//         setState(() {
//           _videoPlayerController.play();
//         });
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             if (_video != null)
//               _videoPlayerController.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: _videoPlayerController.value.aspectRatio,
//                       child: VideoPlayer(_videoPlayerController),
//                     )
//                   : Container()
//             else
//               Text(
//                 "Click on Pick Video to select video",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             RaisedButton(
//               onPressed: () {
//                 _pickVideo();
//               },
//               child: Text("Pick Video From Gallery"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
