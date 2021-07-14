import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/posts_mock.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PostsScreen extends StatefulWidget {

  PostsScreen({Key? key, this.indexScroll}) : super(key: key);

  int? indexScroll;

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late AutoScrollController _controller;
  List<Post> _posts = postsTest;
  final _scrollDirection = Axis.vertical;

  @override
  void initState() {
    super.initState();
    _controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery
                .of(context)
                .padding
                .bottom),
        axis: _scrollDirection);
    _scrollToIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text('Posts', style: TextStyle(color: Colors.white))),
      body: getListPosts(),
    );
  }

  getListPosts() {
    final children = <Widget>[];
    for (var i = 0; i < _posts.length; i++) {
      children.add(_getRow(i, _posts[i]));
    }

    return ListView(
      scrollDirection: _scrollDirection,
      controller: _controller,
      children: children,
    );
  }

  Widget _getRow(int index, Post post) {
    Container container = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          _getHeader(post),
          // TODO: fix this
          //Image(image: NetworkImage(post.mediUrl), fit: BoxFit.cover),
          Row(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 39,
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
    return _wrapScrollTag(index: index, child: container);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _controller,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  _getHeader(Post post) {
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
          width: MediaQuery
              .of(context)
              .size
              .width - 79,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.username,
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text(post.location ?? '',
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

  Future _scrollToIndex() async {
    await _controller.scrollToIndex(widget.indexScroll ?? 0,
    preferPosition: AutoScrollPosition.begin);
  }
}
