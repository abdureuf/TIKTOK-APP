import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Following',style: TextStyle(fontSize:18,color: Colors.white),),
            SizedBox(width: 5,),
            Text('|',style: TextStyle(fontSize:18,color: Colors.white)),
            SizedBox(width: 5,),
            Text('For You',style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }
}
