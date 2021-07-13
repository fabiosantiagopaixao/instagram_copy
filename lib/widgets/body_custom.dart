import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/contants.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/screens/tabs/feed_screen.dart';
import 'package:instagram_copy/screens/tabs/my_profile_screen.dart';

class BodyCustom extends StatelessWidget {
  int type = Constants.FEED;
  Profile? profile;

  BodyCustom(int type, Profile profile) {
    this.type = type;
    this.profile = profile;
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetBody = FeedScreen();
    if (type == Constants.MY_PROFILE) {
      widgetBody = MyProfileScreen();
    }
    return widgetBody;
  }
}
