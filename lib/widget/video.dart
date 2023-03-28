import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key, required this.controller})
      : super(key: key);
  final CachedVideoPlayerController controller;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  @override
  Widget build(BuildContext context) {
    return CachedVideoPlayer(widget.controller);
  }
}
