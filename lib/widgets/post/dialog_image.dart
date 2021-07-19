import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/widgets/post/footer_post.dart';
import 'package:instagram_copy/widgets/post/header_post.dart';
import 'package:instagram_copy/widgets/image_network.dart';

class DialogImage extends StatelessWidget {
  const DialogImage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(53, 53, 53, 0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(53, 53, 53, 1),
            ),
            child: Column(
              children: [
                HeaderPost(post: post, isDialog: true),
                ImageNetWork(urlImage: post.images[0].url),
                FooterPost(currentIndex: 0, post: post, isDialog: true)
              ],
            ),
          )
        ],
      ),
    );
  }


}
