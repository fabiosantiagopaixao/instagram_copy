import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/mock/profile_mock.dart';
import 'package:instagram_copy/models/contants.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/screens/tabs/feed_screen.dart';
import 'package:instagram_copy/screens/tabs/my_profile_screen.dart';
import 'package:instagram_copy/screens/tabs/search_screen.dart';
import 'package:instagram_copy/widgets/app_bar_custom.dart';
import 'package:instagram_copy/widgets/loading_custom.dart';
import "package:mobx/mobx.dart";

part "screen_store.g.dart";

class ScreenStore = _ScreenStore with _$ScreenStore;

abstract class _ScreenStore with Store {
  @observable
  Profile profile = profileTest;

  @observable
  ScreenMode currentState = ScreenMode.FEED;

  @observable
  int selectedScreen = Constants.FEED;

  @action
  Profile getProfile() {
    return profile;
  }

  var SCREENS = [
    ScreenMode.FEED,
    ScreenMode.SEARCH,
    ScreenMode.REELS,
    ScreenMode.SHOP,
    ScreenMode.MY_PROFILE
  ];

  @action
  void selectScreen(int screenIndex) {
    selectedScreen = screenIndex;
    currentState = SCREENS[screenIndex];
  }
}

enum ScreenMode { FEED, SEARCH, REELS, SHOP, MY_PROFILE, PROCESSING }

extension ScreenModeWidget on ScreenMode {
  String get name => describeEnum(this);

  Widget get viewAppBar {
    Widget widget = _getDefaultAppBar("Name");
    switch (this) {
      case ScreenMode.FEED:
        widget = AppBarCustom(Constants.FEED);
        break;
      case ScreenMode.SEARCH:
        widget = AppBarCustom(Constants.SEARCH);
        break;
      case ScreenMode.REELS:
        widget = _getDefaultAppBar("Reels");
        break;
      case ScreenMode.SHOP:
        widget = _getDefaultAppBar("Shop");
        break;
      case ScreenMode.MY_PROFILE:
        widget = AppBarCustom(Constants.MY_PROFILE);
        break;
      case ScreenMode.PROCESSING:
        widget = _getDefaultAppBar("Teste");
        break;
    }
    return widget;
  }

  Widget get viewBody {
    Widget widget = LoadingCustom(title: "Loading...");
    switch (this) {
      case ScreenMode.FEED:
        widget = FeedScreen();
        break;
      case ScreenMode.SEARCH:
        widget = SearchScreen();
        break;
      case ScreenMode.REELS:
        widget = LoadingCustom(title: "Loading Reels");
        break;
      case ScreenMode.SHOP:
        widget = LoadingCustom(title: "Loading Shop");
        break;
      case ScreenMode.MY_PROFILE:
        widget = MyProfileScreen();
        break;
      case ScreenMode.PROCESSING:
        widget = LoadingCustom(title: "Processing...");
        break;
    }
    return widget;
  }

  _getDefaultAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
