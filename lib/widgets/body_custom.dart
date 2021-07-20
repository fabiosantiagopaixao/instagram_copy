import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/contants.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/screens/tabs/feed_tab.dart';
import 'package:instagram_copy/screens/tabs/my_profile_tab.dart';

class BodyCustom extends StatelessWidget {
  int type = Constants.FEED;
  Profile? profile;

  BodyCustom(int type, Profile profile) {
    this.type = type;
    this.profile = profile;
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetBody = FeedTab();
    if (type == Constants.MY_PROFILE) {
      widgetBody = MyProfileTab();
    }
    return widgetBody;
  }
}
