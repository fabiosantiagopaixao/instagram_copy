import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/enum/type_gridiew.dart';
import 'package:instagram_copy/screens/search_screen.dart';
import 'package:instagram_copy/widgets/gallery_images.dart';
import 'package:shimmer/shimmer.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
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
        title: getButtonSearch(),
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
        title: getButtonSearch(),
      ),
      body: GalleryImages(type: TypeGridView.INSTAGRAM),
    );
  }

  getButtonSearch() {
    return GestureDetector(
      onTap: () => _openScreenPosts(),
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 35,
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(52, 52, 52, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 27),
                child: Text("Search",
                    style: TextStyle(
                        color: Color.fromRGBO(96, 96, 96, 1), fontSize: 18))),
            Icon(
              Icons.search,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

  void _openScreenPosts() {
    try {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchScreen()));
    } catch (e) {
      print(e);
    }
  }
}
