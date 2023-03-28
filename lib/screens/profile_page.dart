import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktokfinal/model/video.dart';
import 'package:tiktokfinal/provider/playcontroller.dart';

class Profile extends StatefulWidget {
  Profile({
    this.video,
    Key? key,
  }) : super(key: key);
  Video? video;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        centerTitle: true,
        actions: const [
          Icon(
            Icons.remove_red_eye_sharp,
            color: Colors.black,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          SizedBox(
            width: 8,
          ),
        ],
        title:const Text(
          'Abeselom Ademe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.video == null
                            ? CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  'icons/profile.jpg',
                                ))
                            : CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    widget.video!.profile_picture.toString())),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '574',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Following',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '522',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Followers',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '56k',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Likes',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 47,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Provider.of<TikTokState>(context, listen: false)
                                    .PopulateVideoList();
                              },
                              child: Text(
                                'Edit Profie',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 47,
                            height: 47,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            child: Icon(Icons.bookmark)),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // video list
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'icons/profile.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
