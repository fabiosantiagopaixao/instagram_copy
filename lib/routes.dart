import 'package:flutter/widgets.dart';
import 'package:instagram_copy/screens/posts_screen.dart';
import 'package:instagram_copy/screens/tab_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => TabScreen(),
  "/posts": (context) => PostsScreen()
};
