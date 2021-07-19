import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_copy/enum/type_gridiew.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/mock/posts_mock.dart';
import 'package:instagram_copy/widgets/post/dialog_image.dart';
import 'package:instagram_copy/widgets/post/header_post.dart';

import 'post/carrousel_images.dart';
import 'icon_position.dart';
import 'image_network.dart';

class GalleryImages extends StatelessWidget {
  const GalleryImages({Key? key, required this.type, this.onTapFunction})
      : super(key: key);

  final TypeGridView type;
  final Function? onTapFunction;

  // logic: (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1
  @override
  Widget build(BuildContext context) {
    List<Post> _posts = postsTest;
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: _posts.length,
      itemBuilder: (context, index) => imageCard(context, _posts[index], index),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (type == TypeGridView.DEFAULT || type == TypeGridView.MY_PROFILE)
              ? 1
              : getCountWidth(index),
          (type == TypeGridView.DEFAULT || type == TypeGridView.MY_PROFILE)
              ? 1
              : getCountHeight(index)),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    );
  }

  Widget imageCard(BuildContext context, Post post, int index) {
    final children = <Widget>[];

    var imageNetWork =
        ImageNetWork(urlImage: post.images[0].url, boxImageSearch: true);
    if (type == TypeGridView.INSTAGRAM || type == TypeGridView.MY_PROFILE) {
      imageNetWork = ImageNetWork(
        urlImage: post.images[0].url,
        boxImageSearch: true,
        sizeIconError: 30,
        sizeTextError: 10,
      );
    }
//
    children.add(GestureDetector(
        onTap: () => onTapFunction == null ? {} : onTapFunction!(index),
        onLongPress: () {
          _showDialog(context, post);
        },
        child: imageNetWork));

    if (post.images.length > 1) {
      children.add(IconPosition(
          icon: Icons.photo_library,
          positionLeft: (index % 20 == 11) ? 230 : 103.0));
    }

    return Stack(
      children: children,
      fit: StackFit.expand,
    );
  }

  Future<void> _showDialog(BuildContext context, Post post) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DialogImage(post: post);
      },
    );
  }

  int getCountWidth(int index) {
    if (index % 20 == 11) {
      return 2;
    }
    return 1;
  }

  double getCountHeight(int index) {
    if (index % 20 == 2 || ((index % 20) == 11)) {
      return 2;
    }
    return 1;
  }
}
