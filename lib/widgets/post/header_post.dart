import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';

class HeaderPost extends StatelessWidget {
  const HeaderPost({Key? key, required this.post, this.isDialog})
      : super(key: key);
  final Post post;
  final bool? isDialog;

  @override
  Widget build(BuildContext context) {
    Widget container = GestureDetector(
        onTap: () {
          if (isDialog != null && isDialog == true) {
            _closeDialog(context);
          }
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: isDialog == null || isDialog == false
                ? Colors.transparent
                : Color.fromRGBO(96, 96, 96, 1),
            borderRadius: isDialog == null || isDialog == false
                ? BorderRadius.circular(0)
                : BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Icon(
              isDialog == null || isDialog == false
                  ? Icons.more_vert
                  : Icons.close,
              color: Colors.white),
        ));

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
          width: getValueWidth(context),
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
        container
      ],
    );
  }

  double getValueWidth(BuildContext context) {
    double value = 0.35;
    if (isDialog == null || isDialog == false) {
      value = 0.22;
    }
    return MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * value);
  }

  _closeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
