import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_post.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/widgets/list_posts.dart';
import 'package:instagram_copy/widgets/story_list.dart';
import 'package:instagram_copy/mock/profile_mock.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Profile profile = profileTest;

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
          ListPosts(typePost: TypePost.FEED),
        ],
      ),
    );
  }
}
