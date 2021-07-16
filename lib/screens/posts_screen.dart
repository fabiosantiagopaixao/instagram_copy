import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_post.dart';
import 'package:instagram_copy/widgets/list_posts.dart';

class PostsScreen extends StatefulWidget {

  PostsScreen({Key? key, this.indexScroll}) : super(key: key);

  int? indexScroll;

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text('Posts', style: TextStyle(color: Colors.white))),
      body: ListPosts(typePost: TypePost.POST_VIEW, indexScroll: widget.indexScroll),
    );
  }
}
