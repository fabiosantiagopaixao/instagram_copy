import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/posts_mock.dart';
import 'package:instagram_copy/models/post.dart';

import 'image_network.dart';

class GalleryImages extends StatefulWidget {
  const GalleryImages({Key? key, this.onTapFunction}) : super(key: key);
  final Function? onTapFunction;

  @override
  _GalleryImagesState createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = postsTest;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return widgetList(posts[index], index);
      },
    );
  }

  Widget widgetList(Post post, int index) {
    final children = <Widget>[];
    children.add(GestureDetector(
      onTap: () => widget.onTapFunction!(index),
      child: ImageNetWork(
          urlImage: post.images[0].url,
          fitImage: BoxFit.fitHeight,
          heightImage: 200,
          widthImage: 200),
    ));
    if (post.images.length > 1) {
      children.add(Positioned(
        top: 8.0,
        left: 103.0,
        child: Container(
          height: 18,
          width: 18,
          child: Icon(
            Icons.photo_library,
            color: Colors.white,
            size: 18.0,
          ),
        ),
      ));
    }
    return Stack(children: children);
  }
}
