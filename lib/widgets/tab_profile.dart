import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/posts_mock.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/screens/posts_screen.dart';
import 'package:instagram_copy/widgets/image_network.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  _TabProfileState createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.apps_outlined)),
              Tab(icon: Icon(Icons.assignment_ind)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            getTabViewGrid(),
            getTabViewMarkes(),
          ],
        ),
      ),
    );
  }

  getTabViewGrid() {
    final children = <Widget>[];
    List<Post> posts = postsTest;
    int line = 0;
    if (posts.length > 3) {
      for (var i = 0; i < posts.length; i++) {
        List<Post> newList = [];
        if (i < posts.length) {
          newList.add(posts[i]);
        }
        i++;
        if (i < posts.length) {
          newList.add(posts[i]);
        }
        i++;
        if (i < posts.length) {
          newList.add(posts[i]);
        }
        children.add(getLineBox(line, newList));
        line++;
      }
    } else {
      children.add(getLineBox(line, posts));
    }

    return ListView(
      scrollDirection: Axis.vertical,
      children: children,
    );
  }

  Widget getLineBox(int line, List<Post> posts) {
    final elements = <Widget>[];
    double sizeBox = (MediaQuery.of(context).size.width - 4) / 3;
    posts.asMap().forEach((key, value) {
      elements.add(Center(
        child: GestureDetector(
          onTap: () => _openScreenPosts(
              value.images[0], line == 0 ? key : (line * 2) + (line + key)),
          child: Container(
              margin: key == 1
                  ? EdgeInsets.fromLTRB(2, 0, 2, 0)
                  : EdgeInsets.all(0),
              height: sizeBox,
              width: sizeBox,
              color: Colors.white24,
              child: getBoxMultiple(value)),
        ),
      ));
    });

    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: elements,
      ),
    );
  }

  Widget getBoxMultiple(Post post) {
    final children = <Widget>[];
    children.add(ImageNetWork(
        urlImage: post.images[0],
        fitImage: BoxFit.fitHeight,
        heigthImage: 200,
        widthImage: 200));
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

  getTabViewMarkes() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.assignment_ind,
                color: Colors.white,
                size: 100,
              ),
              Text(
                "Photos and Videos of You",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 3),
                child: Text(
                  "When people ta you in photos and videos, they'll appear here.",
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openScreenPosts(String mediaUrl, int indexScroll) async {
    try {
      print("Open Post ${indexScroll}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostsScreen(indexScroll: indexScroll)));
    } catch (e) {
      print(e);
    }
  }
}
