import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  const VideoScreen({Key? key,required this.videoUrl}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

 late final YoutubePlayerController controller;

 @override
  void initState() {
   controller= YoutubePlayerController(initialVideoId: widget.videoUrl);
    super.initState();
  }


  @override
  void dispose() {
    controller.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayerIFrame(
              controller: controller,
              aspectRatio: 10 / 8,
            ),
          ),
           Positioned(
            top: 50,
            right: 20,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  size: 20,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
