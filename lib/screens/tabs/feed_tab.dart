import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_post.dart';
import 'package:instagram_copy/widgets/list_posts.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarFeed(),
      body: Column(
        children: [ListPosts(typePost: TypePost.FEED)],
      ),
    );
  }

  getAppBarFeed() {
    return AppBar(
      title: Image(
        image: ExactAssetImage("assets/logo.png"),
        width: 100.0,
      ),
      actions: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add_box_outlined),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.favorite_border),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ),
      ],
    );
  }
}
