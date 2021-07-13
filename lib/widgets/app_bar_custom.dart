import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/profile_mock.dart';
import 'package:instagram_copy/models/contants.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/store/screen_store.dart';

class AppBarCustom extends StatelessWidget {
  Profile profile = profileTest;
  int selectedScreen = 0;

  AppBarCustom(int selectedScreen) {
    this.selectedScreen = selectedScreen;
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetAppBar = getAppBarFeed();

    if (selectedScreen == Constants.MY_PROFILE) {
      widgetAppBar = getAppBarMyProfile();
    }
    print("Test Bar Custom ${selectedScreen}");
    return widgetAppBar;
  }

  getAppBarFeed() {
    return AppBar(
      title: Image(
        image: ExactAssetImage("assets/logo.png"),
        width: 100.0,
      ),
      actions: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add_box_outlined),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.favorite_border),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ),
      ],
    );
  }

  getAppBarMyProfile() {
    return AppBar(
      title: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.lock, color: Colors.white)),
          Text(profile.username),
        ],
      ),
      actions: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add_box_outlined),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 50, height: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
