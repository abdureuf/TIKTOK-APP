import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:tiktokfinal/model/video.dart';

class TikTokState with ChangeNotifier {
  List<Video> _videos = [];
  bool isPaused = false;
  int currentpage = 0;

  get Videos {
    return _videos;
  }

  get issettopaused {
    return isPaused;
  }

  Future<void> PopulateVideoList() async {
    final url = Uri.parse(
        'https://tiktok-75b35-default-rtdb.firebaseio.com/videos.json'
    );
    var response = await HTTP.get(url);
    if (response.statusCode == 200) {
      List<Video> _tempvideos = [];
      var jsonResponse = json.decode(response.body) ;
      print(jsonResponse);
      jsonResponse.forEach((value) {
        _tempvideos.add(Video(
            url:value['url'],
            likes:value['likes'],
            comments:value['comments'],
            shares:value['shares'],
          profile_picture:value['profile_picture'],
        )
        );
      });
      _videos = _tempvideos;
      _videos.forEach((element) {print(element);});
    }

    for (var element in _videos) {
      print(element.url);
      print(element.likes);
    }
    notifyListeners();
  }

  void pause() {
    isPaused = true;
    notifyListeners();
  }

  void play() {
    isPaused = false;
    notifyListeners();
  }


}
