import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoScreen extends StatefulWidget {
  final YoutubePlayerController controller;
  const VideoScreen({Key? key,required this.controller}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    widget.controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: widget.controller,
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
                backgroundColor: Colors.black,
                radius: 15,
                child: Icon(Icons.close,color: Colors.white,size: 20,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
