import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieVideo extends StatefulWidget {
  final String url;

  const ChewieVideo({Key? key, required this.url}) : super(key: key);

  @override
  _ChewieVideoState createState() => _ChewieVideoState();
}

class _ChewieVideoState extends State<ChewieVideo> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    await videoPlayerController.initialize();

    setState(() {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false,
      );
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return chewieController != null
        ? AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: Chewie(controller: chewieController!),
          )
        : Center(child: CircularProgressIndicator());
  }
}
