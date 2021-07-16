import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_post.dart';
import 'package:instagram_copy/mock/posts_mock.dart';
import 'package:instagram_copy/mock/profile_mock.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/widgets/story_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'carrousel_images.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({Key? key, required this.typePost, this.indexScroll})
      : super(key: key);
  final TypePost typePost;
  final int? indexScroll;

  @override
  _ListPostsState createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  Profile profile = profileTest;
  late AutoScrollController _controller;
  List<Post> _posts = postsTest;
  final _scrollDirection = Axis.vertical;

  @override
  void initState() {
    super.initState();
    if (widget.typePost == TypePost.POST_VIEW) {
      print("Select item ${widget.indexScroll}");
      _controller = AutoScrollController(
          viewportBoundaryGetter: () =>
              Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
          axis: _scrollDirection);
      _scrollToIndex();
    }
  }

  Future _scrollToIndex() async {
    await _controller.scrollToIndex(widget.indexScroll ?? 0,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    return widget.typePost == TypePost.FEED
        ? getListPosts()
        : getListPostsView();
  }

  getListPosts() {
    final children = <Widget>[];
    children.add(StoryList(profile.storys));
    for (var i = 0; i < _posts.length; i++) {
      Post post = _posts[i];
      children.add(CarouselImages(post: post));
    }

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: children,
      ),
    );
  }

  getListPostsView() {
    final children = <Widget>[];
    for (var i = 0; i < _posts.length; i++) {
      Post post = _posts[i];
      children.add(_getRow(i, post));
    }

    return ListView(
      scrollDirection: _scrollDirection,
      controller: _controller,
      children: children,
    );
  }

  Widget _getRow(int index, Post post) {
    return _wrapScrollTag(index: index, child: CarouselImages(post: post));
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
}
