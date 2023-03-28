import 'package:flutter/material.dart';
import '../data/tiktok.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
       title: const Text('Al Activity ',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: const [
          Icon(Icons.send,color: Colors.black,)
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: TikTok.tiktokdata[0]['user'].length,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(TikTok.tiktokdata[0]
                          ['user'][index]['avatar']['jpeg']['medium']
                              .toString()),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TikTok.tiktokdata[0]['user'][index]['name']
                                  .toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                TikTok.tiktokdata[0]['user'][index]['id']
                                    .toString(),
                                style:
                                const TextStyle(fontWeight: FontWeight.w100)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red,
                          )),
                      child: const Text('Follow back'))
                ],
                
              ),
            );
          }),
    );
  }
}
