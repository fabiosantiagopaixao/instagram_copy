import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_gridiew.dart';
import 'package:instagram_copy/widgets/gallery_images.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? _buildShimmer() : _buildScreen();
  }

  Widget _buildShimmer() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Shimmer.fromColors(
        baseColor: Color.fromRGBO(64, 64, 64, 1),
        highlightColor: Color.fromRGBO(96, 96, 96, 1),
        enabled: true,
        child: GalleryImages(type: TypeGridView.INSTAGRAM),
      ),
    );
  }

  Widget _buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: GalleryImages(type: TypeGridView.INSTAGRAM),
    );
  }
}
