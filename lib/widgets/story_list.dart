import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/story.dart';

// ignore: must_be_immutable
class StoryList extends StatelessWidget {
  List<Story> storys = [];

  StoryList(List<Story>? storys) {
    this.storys = storys!;
  }

  @override
  Widget build(BuildContext context) {
    return getListStatus();
  }

  Widget getListStatus() {
    final children = <Widget>[];
    children.add(getBoxAddStatusPhoto());
    for (var i = 0; i < this.storys.length; i++) {
      Story story = this.storys[i];
      children.add(getBoxPhoto(story));
    }

    return Container(
      height: 100.0,
      margin: EdgeInsets.only(bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }

  getBoxPhoto(Story story) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getStackStatus(AssetImage(story.profileImage), false),
        Text(
          story.name.length > 7
              ? story.name.substring(0, 10) + "..."
              : story.name,
          style: TextStyle(fontSize: 12.0, color: Colors.white),
        )
      ],
    );
  }

  getStackStatus(AssetImage image, bool yourStory) {
    return Stack(children: [getPhoto(image, yourStory)]);
  }

  getPhoto(AssetImage image, bool yourStory) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
      width: 70.0,
      padding: EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        gradient: yourStory
            ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                    Colors.white10,
                    Colors.white30,
                  ])
            : LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                    Colors.red,
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                    Colors.red,
                    Colors.deepOrangeAccent,
                  ]),
        color: yourStory ? Colors.black : Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 70.0,
        padding: EdgeInsets.all(3.0),
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 30.0,
          backgroundImage: image,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  getBoxAddStatusPhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getStackAddSatus(true),
        Text(
          "Your Story",
          style: TextStyle(fontSize: 12.0, color: Colors.white),
        )
      ],
    );
  }

  getStackAddSatus(bool yourStory) {
    return Stack(children: [
      getPhoto(AssetImage("assets/my_profile.png"), yourStory),
      Positioned(
        top: 52.0,
        left: 60.0,
        child: Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
      Positioned(
        top: 54.0,
        left: 62.0,
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 16.0,
          ),
        ),
      ),
    ]);
  }
}
