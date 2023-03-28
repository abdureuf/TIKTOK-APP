import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Send To',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                  Text('user2368')
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  Text('More')
                ],
              ),
            ],
          ),
          Column(

            children: [
              const Text(
                'Send To',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.flag_outlined,color: Colors.black),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.bookmark_outlined,color: Colors.black),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.heart_broken_outlined,color: Colors.black,),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.download_for_offline_rounded,color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.flag_outlined,color: Colors.black),
              ),
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.bookmark_outlined,color: Colors.black),
              ),
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.heart_broken_outlined,color: Colors.black,),
              ),
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.download_for_offline_rounded,color: Colors.black),
              ),
            ],
          ),
          Container(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ))),
        ],
      ),
    );
  }
}
