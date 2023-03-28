import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktokfinal/provider/playcontroller.dart';
import 'package:tiktokfinal/screens/profile_page.dart';
import 'package:tiktokfinal/widget/loading.dart';
import 'package:tiktokfinal/widget/player.dart';
import 'package:tiktokfinal/widget/topnav.dart';
import '../widget/onscreenpause.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Provider.of<TikTokState>(context,listen: false).PopulateVideoList(),
        builder: (ctx, data) {

          if (data.connectionState == ConnectionState.waiting ) {
             return TikTokLoadingAnimation();
          }
          else
          {
            return Consumer<TikTokState>(
              builder: (BuildContext context, value, Widget? child) {
              return PageView.builder(
                  itemCount: value.Videos.length,
                  scrollDirection: Axis.vertical,
                  // swipePositionThreshold: 0.1,
                  // animationDuration: const Duration(milliseconds: 200),
                  itemBuilder: (ctx, index) {
                    print(value.Videos.length );
                    print("total length ");
                    if(value.Videos.length == 0){
                      return TikTokLoadingAnimation();
                    }
                    return PageView(
                      children:[Stack(
                        children: [
                          Player(value.Videos[index]),
                          const OnScreenControls(),
                          const TopNav(),
                        ],
                      ),
                       Profile(video:value.Videos[index])]
                    );
                  });},
            );
          }

        });
  }
}
