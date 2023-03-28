import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  Comment({Key? key, this.profile}) : super(key: key);
  final profile;
  final comments = [
    {
      "likes": 132,
      "comment": "This is so funny!",
      "username": "jenny_martinez",
      "profile_picture_url": "https://p16.tiktokcdn.com/musically-maliva-obj/1647596478025734~c5_300x300.jpeg"
    },
    {
      "likes": 79,
      "comment": "Love this song!",
      "username": "john_smith",
      "profile_picture_url": "https://p16.tiktokcdn.com/tos-maliva-avt-0068/647aa293a6559758be616b0a34599247~c5_300x300.jpeg"
    },
    {
      "likes": 45,
      "comment": "Amazing video!",
      "username": "emily_wong",
      "profile_picture_url": "https://p16.tiktokcdn.com/tos-maliva-avt-0068/7a8e65378881c342a6c490c7dbdbb27f~c5_300x300.webp"
    },
    {
      "likes": 24,
      "comment": "Nice dance moves!",
      "username": "alex_lee",
      "profile_picture_url": "https://p16.tiktokcdn.com/tos-maliva-avt-0068/f5cc512794caabf0e38df3b592ce3f7d~c5_300x300.jpeg"
    },
    {
      "likes": 12,
      "comment": "Great job!",
      "username": "sara_jones",
      "profile_picture_url": "https://p16.tiktokcdn.com/tos-maliva-avt-0068/bc522a936de36ae0e274309fbe7c5772~c5_300x300.jpeg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${comments.length} Comments'),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder:(ctx,index){
                return ListTile(
                  leading: CircleAvatar(
                backgroundImage: NetworkImage(comments[index]['profile_picture_url'].toString()),
                ),
                  subtitle: Text(comments[index]['comment'].toString()),
                  trailing: Column(
                    children: [
                      Icon(Icons.favorite_border_outlined,),
                      Text(comments[index]['likes'].toString())
                    ],
                  ),
                  title: Text(comments[index]['username'].toString()),
                );
              },
            ),
          ),TikTokCommentInput(profile),
        ],
      ),
    );
  }
}

class TikTokCommentInput extends StatefulWidget {

  TikTokCommentInput( this.profile);
  final profile;
  @override
  _TikTokCommentInputState createState() => _TikTokCommentInputState();
}

class _TikTokCommentInputState extends State<TikTokCommentInput> {
  final TextEditingController _textController = TextEditingController();
  bool _showSubmitButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(widget.profile),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: _showSubmitButton ? 8.0 : 0.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    setState(() {
                      _showSubmitButton = text.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
          ),
          if (_showSubmitButton)
            GestureDetector(
              onTap: () {
                  _textController.clear();
                  setState(() {
                    _showSubmitButton = false;
                  });
                }
              ,
              child: Container(
                width: 48.0,
                height: 48.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
