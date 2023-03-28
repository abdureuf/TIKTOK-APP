import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/playcontroller.dart';

class OnScreenControls extends StatelessWidget {
  const OnScreenControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool state = Provider.of<TikTokState>(context).issettopaused;
    return state?const Center(
        child: Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 100,
    )):Container();
  }
}
