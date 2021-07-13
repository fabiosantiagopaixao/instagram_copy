import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:instagram_copy/mock/profile_mock.dart';
import 'package:instagram_copy/models/contants.dart';
import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/store/screen_store.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final screenStore = ScreenStore();
  Profile profile = profileTest;

  _onTap(int tab) {
    if (screenStore.selectedScreen != tab) {
      setState(() {
        screenStore.selectScreen(tab);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => screenStore,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Observer(builder: (_) {
              return screenStore.currentState.viewAppBar;
            }),
          ),
          body: SafeArea(child: Observer(builder: (_) {
            return screenStore.currentState.viewBody;
          })),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.white10, width: 0.75))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(Icons.home, Constants.FEED),
                buildNavItem(Icons.search, Constants.SEARCH),
                buildNavItem(Icons.slow_motion_video_outlined, Constants.REELS),
                buildNavItem(Icons.shop, Constants.SHOP),
                buildNavItem(null, Constants.MY_PROFILE),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNavItem(IconData? iconData, int index) {
    return GestureDetector(
        onTap: () => _onTap(index),
        child: index == Constants.MY_PROFILE
            ? getProfileNav(index)
            : getDefaultNav(iconData!, index));
  }

  getDefaultNav(IconData iconData, int index) {
    return Container(
      width: 40.0,
      height: 40,
      child: Icon(iconData,
          color:
              index == screenStore.selectedScreen ? Colors.white : Colors.grey,
          size: 30.0),
    );
  }

  getProfileNav(int index) {
    return Container(
      width: 40.0,
      padding: EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        color:
            index == screenStore.selectedScreen ? Colors.white : Colors.black,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage("assets/my_profile.png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
