import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_gridiew.dart';
import 'package:instagram_copy/screens/posts_screen.dart';
import 'package:instagram_copy/widgets/gallery_images.dart';

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
            GalleryImages(
                type: TypeGridView.DEFAULT, onTapFunction: openScreenPosts),
            getTabViewMarks(),
          ],
        ),
      ),
    );
  }

  getTabViewMarks() {
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

  void openScreenPosts(int indexScroll) {
    try {
      print("Clicked");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostsScreen(indexScroll: indexScroll)));
    } catch (e) {
      print(e);
    }
  }
}
