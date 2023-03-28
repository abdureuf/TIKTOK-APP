import 'package:flutter/material.dart';
import 'package:tiktokfinal/animations/spinner_animation.dart';
import 'package:tiktokfinal/widget/audio_spinner_icon.dart';
import 'package:numeral/numeral.dart';

import '../widget/comment.dart';
import '../widget/share.dart';

class Utils extends StatefulWidget {
  const Utils({Key? key, required this.Profile, required this.like, required this.comment, required this.share}) : super(key: key);
  final String Profile;
  final int like;
  final int comment;
  final int share;
  @override
  State<Utils> createState() => _UtilsState();
}

class _UtilsState extends State<Utils> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 15,
        bottom: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(widget.Profile),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  liked = !liked;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Image.asset(
                  'icons/like.png',
                  height: 40,
                  color: liked ? Colors.red : Colors.white,
                ),
              ),
            ),
             Text(
               Numeral(widget.like).format(),
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Comment(profile:widget.Profile);
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Image.asset(
                  'icons/chat.png',
                  height: 50,
                ),
              ),
            ),
             Text(
              Numeral(widget.comment).format(),
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Share();
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Image.asset(
                  'icons/share.png',
                  height: 42,
                ),
              ),
            ),
             Text(
               Numeral(widget.share).format(),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5,),
            SpinnerAnimation(body: audioSpinner(widget.Profile))
          ],
        ));
  }
}
