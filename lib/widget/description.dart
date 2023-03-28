import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 20,
        child: Container(
          width: 200,
      child: Column(
        children: [
          Text(' If you love to dance and participate in viral dance challenges, this tag is perfect for you.',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
       Text('#foodie,#DIYideas:,#dancechallenge:,#learnontiktok: ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
