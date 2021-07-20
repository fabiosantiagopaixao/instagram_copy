import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  int _currentTabIndex = 0;
  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Top'),
    Tab(text: 'Accounts'),
    Tab(text: 'Audio'),
    Tab(text: 'Tags'),
    Tab(text: 'Places'),
  ];
  //late TabController _tabController;

  @override
  void initState() {
    super.initState();
    /*_tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 0);*/
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: getButtonSearch()),
      body: getTabs(),
    );
  }

  getTabs() {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: new Size(0.0, 0.0),
            child: TabBar(
              unselectedLabelColor: Color.fromRGBO(100, 100, 100, 1),
              labelPadding: EdgeInsets.zero,
              tabs: _tabs,
            ),
          ),
        ),
        body: TabBarView(
          //controller: _tabController,
          children: _tabs.map((Tab tab) {
            final String labelTab = tab.text!.toLowerCase();
            return getBody(labelTab);
          }).toList(),
        ),
      ),
    );
  }

  Widget getBody(String tab) {
    return Container(
      color: Colors.black,
      height: 500,
      width: 500,
      alignment: Alignment.center,
      child: Text(tab, style: TextStyle(color: Colors.red)),
    );
  }

  getButtonSearch() {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 32,
        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(52, 52, 52, 1),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
            cursorColor: Colors.white,
            cursorWidth: 1,
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)))),
      ),
    );
  }
}
