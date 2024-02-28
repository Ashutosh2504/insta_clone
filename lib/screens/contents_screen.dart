// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/screens/options_screen.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({
    Key? key,
    required this.src,
  }) : super(key: key);
  final String src;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
      allowFullScreen: true,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image.asset(
        //   widget.src,
        //   fit: BoxFit.cover,
        // ),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(controller: _chewieController!)
                : SizedBox(),
        OptionsScreen(),
      ],
    );
  }
}
