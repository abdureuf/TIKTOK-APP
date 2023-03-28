import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:tiktokfinal/widget/description.dart';
import 'package:tiktokfinal/widget/overlay.dart';
import 'package:tiktokfinal/widget/video.dart';
import 'package:provider/provider.dart';
import '../provider/playcontroller.dart';
class Player extends StatefulWidget {
   Player(this.value);
  var value;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late CachedVideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(widget.value.url);
    _controller.initialize().then((value) {
      _controller.setLooping(true);
      _controller.play();
      Provider.of<TikTokState>(context,listen: false).play();

    });
  }


  void changeVideo(String newvideo) async {
    _controller.pause();
    // _controller.value = CachedVideoPlayerValue.uninitialized();

    _controller =  CachedVideoPlayerController.network(newvideo);
    _controller.play();
    Provider.of<TikTokState>(context,listen: false).play();

  }




  void playController() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      Provider.of<TikTokState>(context,listen: false).pause();
    } else {
      _controller.play();
      Provider.of<TikTokState>(context,listen: false).play();

    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap:playController,
            child: VideoPlayer(
              controller: _controller,
            )),
        Utils(Profile: widget.value.profile_picture, like: widget.value.likes, comment: widget.value.comments, share: widget.value.shares,),
        Description()
      ],
    );
  }
}
