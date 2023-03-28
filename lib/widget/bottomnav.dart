import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, required this.currentselected, required this.change}) : super(key: key);
  final int currentselected;
  final Function change;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: currentselected == 0 ? Colors.black : Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      currentIndex: currentselected,
      selectedItemColor:
      currentselected == 0 ? Colors.white : Colors.black,
      unselectedFontSize: 12,
      iconSize: 15,
      unselectedItemColor:
      currentselected == 0 ? Colors.white54 : Colors.black,
      selectedFontSize: 12,
      onTap:(index)=> change(index),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
                child: Image.asset('icons/home.png', height: 25)),
            label: 'Home'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
                child: Image.asset('icons/search.png', height: 25)),
            label: 'Discover'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
                child: Image.asset(
                  currentselected == 0
                      ? 'icons/camerab.png'
                      : 'icons/camera.png',
                  height: 37,
                )),
            label: ''),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
                child: Image.asset(
                  'icons/inbox.png',
                  height: 25,
                )),
            label: 'Inbox'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
                child: Image.asset(
                  'icons/profile.png',
                  height: 25,
                )),
            label: 'Me'),
      ],
    ) ;
  }
}
