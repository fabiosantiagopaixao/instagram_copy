import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/Post.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/widgets/story_list.dart';
import 'package:instagram_copy/mock/profile_mock.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Profile profile = profileTest;

  Feed(Profile profile) {
    this.profile = profile;
  }

  @override
  Widget build(BuildContext context) {
    return getFeedScreen();
  }

  getFeedScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          StoryList(profile.storys),
          getListPosts(),
        ],
      ),
    );
  }

  getListPosts() {
    final children = <Widget>[];
    List<Post> posts = Post.getPostsTest();
    for (var i = 0; i < posts.length; i++) {
      Post post = posts[i];
      children.add(getBox(post));
    }

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: children,
      ),
    );
  }

  Widget getBox(Post post) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          getHeader(post),
          Image(image: NetworkImage(post.mediUrl), fit: BoxFit.cover),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 39,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                    Container(
                      width: 35,
                      child: Icon(Icons.comment, color: Colors.white),
                    ),
                    Container(
                      width: 35,
                      child: Icon(Icons.near_me_outlined, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child:
                            Icon(Icons.bookmark_border, color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  getHeader(Post post) {
    return Row(
      children: [
        Container(
          width: 40.0,
          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          decoration: new BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white10,
                  Colors.white30,
                ]),
          ),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(post.imageUser),
            backgroundColor: Colors.transparent,
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width - 79,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.username,
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text(post.location ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.more_vert, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
