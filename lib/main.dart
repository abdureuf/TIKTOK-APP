import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/playcontroller.dart';
import './screens/camera.dart';
import './screens/discovery_page.dart';
import './screens/home_page.dart';
import './screens/inbox_page.dart';
import './screens/profile_page.dart';
import './widget/bottomnav.dart';
import 'firebase_options.dart';

List<CameraDescription> _cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _cameras = await availableCameras();
  print(_cameras);
  runApp(
    ChangeNotifierProvider.value(
      value: TikTokState(),
      child: MaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var currentselected = 0;

  final List pages = [
    const Home(),
    const Discover(),
    CameraPage(cameras: _cameras),
    const Inbox(),
     Profile(),
  ];

  void changePage(index) {
    if (currentselected == index) {
      return;
    }
    setState(() {
      currentselected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: pages[currentselected],
        bottomNavigationBar: BottomNav(currentselected: currentselected, change: changePage));
  }
}
