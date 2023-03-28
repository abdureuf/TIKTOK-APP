import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktokfinal/data/tiktok.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             width: double.infinity,
             height: 40,
           ),
           Row(
             children: [
               Container(
                 margin: const EdgeInsets.only(left: 10),
                 decoration: BoxDecoration(
                     color: Colors.grey.withOpacity(0.3),
                     borderRadius: const BorderRadius.all(Radius.circular(4))),
                 width: MediaQuery.of(context).size.width - 90,
                 height: 40,
                 child: const TextField(
                   decoration: InputDecoration(
                       prefixIcon: Icon(Icons.search),
                       hintText: 'Search',
                       border: InputBorder.none),
                 ),
               ),
               TextButton(
                   onPressed: () {},
                   child: const Text(
                     'Search',
                     style: TextStyle(color: Colors.red, fontSize: 17),
                   ))
             ],
           ),
           Expanded(
             child: ListView(
               children: [
                 Image.asset(
                   'images/advertisment.jpg',
                 ),
                 ListView.builder(
                     shrinkWrap: true,
                     physics: const ScrollPhysics(),
                     itemCount: TikTok.tiktokdata[0]['hashtag'].length,
                     itemBuilder: (ctx, index) {
                       return Container(
                         width: MediaQuery.of(context).size.width,
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       margin: const EdgeInsets.all(10),
                                       child: const CircleAvatar(
                                         radius: 20,
                                         backgroundImage:
                                         AssetImage('icons/hashtag.png'),
                                       ),
                                     ),
                                     Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       mainAxisAlignment:
                                       MainAxisAlignment.start,
                                       children: [
                                         Text(
                                           TikTok.tiktokdata[0]['hashtag'][index]
                                           ['name']
                                               .toString()
                                               .substring(1),
                                           style: const TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20),
                                         ),
                                         Text(
                                           'Trending hashtag',
                                           style: TextStyle(
                                               color: Colors.black
                                                   .withOpacity(0.5)),
                                         )
                                       ],
                                     ),
                                   ],
                                 ),
                                 Container(
                                   padding: const EdgeInsets.all(2),
                                   decoration: BoxDecoration(
                                     border: Border.all(
                                         width: 2, color: Colors.black12),
                                     borderRadius: const BorderRadius.all(
                                         Radius.circular(5)),
                                   ),
                                   margin: const EdgeInsets.all(9),
                                   child: Row(
                                     children: [
                                       Text(
                                         NumberFormat.compact()
                                             .format(TikTok.tiktokdata[0]
                                         ['hashtag'][index]['stats']
                                         ['views'])
                                             .toString(),
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 15),
                                       ),
                                       const Icon(Icons.arrow_forward_ios_rounded,size: 13,)
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                             Container(
                               width: double.infinity,
                               height: 150,
                               child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: 6,
                                   itemBuilder: (ctx, x) {
                                     return Container(
                                       height: 60,
                                       width: 90,
                                       child: Image.asset('images/$x.png'),
                                     );
                                   }),
                             )
                           ],
                         ),
                       );
                     }),
               ],
             ),
           ),
         ],
       ),
    );
      }
}
