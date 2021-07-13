import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/profile_mock.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/screens/posts_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  int _selectedTabIndex = 0;
  Profile profile = profileTest;
  double screenSize = 500;
  List<Widget> tabList = [
    new Tab(
      text: 'Overview',
    ),
    new Tab(
      text: 'Workouts',
    )
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getScreenMain();
  }

  getScreenMain() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getProfilePhotoData(),
          getDataProfile(),
          getButtonEditProfile(),
          getTabViewProfile(),
          _selectedTabIndex == 0 ? getTabViewGrid() : getTabViewMarkes()
        ],
      ),
    );
  }

  getProfilePhotoData() {
    return Row(
      children: [
        getPhotoProfile(true),
        getBoxsActivitys(),
      ],
    );
  }

  getPhotoProfile(bool yourStory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
          width: 90.0,
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
            width: 90.0,
            padding: EdgeInsets.all(3.0),
            decoration: new BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 45.0,
              backgroundImage: AssetImage("assets/my_profile.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  getBoxsActivitys() {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Row(
        children: [
          getBoxActivity("5", "Posts"),
          getBoxActivity("99", "Followers"),
          getBoxActivity("150", "Following"),
        ],
      ),
    );
  }

  getBoxActivity(String value, String label) {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 15))
        ],
      ),
    );
  }

  getDataProfile() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(profile.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(profile.bio ?? "",
                  style: TextStyle(color: Colors.white))),
          Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: InkWell(
                child: Text(profile.website ?? "",
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () => launch("https://${profile.website}"),
              )),
        ],
      ),
    );
  }

  getButtonEditProfile() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 80,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(160, 160, 160, 1), // red as border
                    // color
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(160, 160, 160, 1), // red as border
                    // color
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  getTabViewProfile() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _onItemTabTapped(0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Center(
                child: Icon(Icons.apps_outlined, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: _selectedTabIndex == 0
                              ? Colors.white
                              : Colors.black))),
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTabTapped(1),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Center(
                child: Icon(Icons.assignment_ind, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: _selectedTabIndex == 1
                              ? Colors.white
                              : Colors.black))),
            ),
          )
        ],
      ),
    );
  }

  getTabViewGrid() {
    final children = <Widget>[];
    List<Post> posts = Post.getPostsTest();
    children.add(getLineBox(posts));
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: children,
      ),
    );
  }

  Widget getLineBox(List<Post> posts) {
    final elements = <Widget>[];
    double sizeBox = (MediaQuery.of(context).size.width - 4) / 3;
    posts.asMap().forEach((key, value) {
      print("Key ${key}");
      elements.add(Center(
        child: GestureDetector(
          onTap: () => _openScreenPosts(),
          child: Container(
              margin: key == 1
                  ? EdgeInsets.fromLTRB(2, 0, 2, 0)
                  : EdgeInsets.all(0),
              height: sizeBox,
              width: sizeBox,
              color: Colors.white24,
              child: Image(
                  image: NetworkImage(value.mediUrl), fit: BoxFit.fitHeight)),
        ),
      ));
    });

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: elements,
      ),
    );
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

  _onItemTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _openScreenPosts() async {
    try {
      print("Open Screen Posts");
      Navigator.pop(context, PostsScreen());
    } catch (e) {
      print(e);
    }
  }
}
