import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';

class FooterPost extends StatelessWidget {
  const FooterPost(
      {Key? key, required this.currentIndex, required this.post, this.isDialog})
      : super(key: key);
  final int currentIndex;
  final Post post;
  final bool? isDialog;

  @override
  Widget build(BuildContext context) {
    Widget _getActions() {
      return Container(
        width: getValueWidth(context),
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
      );
    }

    Widget _getActionSave() {
      return Container(
        width: getValueWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.bookmark_border, color: Colors.white),
          ],
        ),
      );
    }

    Widget _getButtonsStatusSlide() {
      int index = 0;
      return Container(
        width: getValueWidth(context),
        child: (isDialog == null || isDialog == false) && post.images.length > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: post.images.map((url) {
                  Container container = Container(
                    width: currentIndex == index
                        ? 5.0
                        : index > 5
                            ? 3.5
                            : currentIndex - 6 <= index
                                ? 5.0
                                : 3.5,
                    height: currentIndex == index
                        ? 5.0
                        : index > 5
                            ? 3.5
                            : currentIndex - 6 <= index
                                ? 5.0
                                : 3.5,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          currentIndex == index ? Colors.blue : Colors.white54,
                    ),
                  );
                  index++;
                  return container;
                }).toList(),
              )
            : Container(),
      );
    }

    final children = <Widget>[];
    children.add(_getActions());
    children.add(_getButtonsStatusSlide());
    children.add(_getActionSave());

    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
      child: Row(
        children: children,
      ),
    );
  }

  double getValueWidth(BuildContext context) {
    if (isDialog != null && isDialog == true) {
      return MediaQuery.of(context).size.width / 3 - 17;
    }
    return MediaQuery.of(context).size.width / 3 - 2;
  }
}
