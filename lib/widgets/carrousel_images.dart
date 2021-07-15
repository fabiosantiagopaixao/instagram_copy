import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/widgets/image_network.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({Key? key, required this.imgList}) : super(key: key);
  final List<String> imgList;

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int _currentIndex = 0;
  String _currentLabel = '';

  @override
  void initState() {
    super.initState();
    _currentLabel = '1/${widget.imgList.length}';
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return getBox();
      },
    );
  }

  Widget getBox() {
    final children = <Widget>[];
    children.add(getCarrousell());
    if (widget.imgList.length > 1) {
      children.add(Positioned(
        top: 20.0,
        right: 20,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(50, 50, 50, 0.8),
          ),
          child: Text(_currentLabel,
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ));
    }
    return Stack(children: children);
  }

  Widget getCarrousell() {
    final double height = 400;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    _currentLabel = '${index + 1}/${widget.imgList.length}';
                  });
                }),
            items: widget.imgList
                .map(
                    (item) => ImageNetWork(urlImage: item, heigthImage: height))
                .toList(),
          ),
          getFooter()
        ],
      ),
    );
  }

  Widget getFooter() {
    final children = <Widget>[];
    children.add(getActions());
    if (widget.imgList.length > 1) {
      children.add(getStatusSlide());
    }
    children.add(getActionSave());

    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
      child: Row(
        children: children,
      ),
    );
  }

  Widget getActions() {
    return Container(
      width: widget.imgList.length == 1
          ? MediaQuery.of(context).size.width / 2 - 3
          : MediaQuery.of(context).size.width / 3 - 2,
      child: Row(
        children: [
          Container(
            width: 35,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
          Container(
            width: 35,
            child: Icon(Icons.comment, color: Colors.white),
          ),
          Container(
            width: 35,
            child: Icon(Icons.near_me_outlined, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget getStatusSlide() {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgList.map((url) {
          int index = widget.imgList.indexOf(url);
          return Container(
            width: 6.0,
            height: 6.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.blue : Colors.white54,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget getActionSave() {
    return Container(
      width: widget.imgList.length == 1
          ? MediaQuery.of(context).size.width / 2 - 3
          : MediaQuery.of(context).size.width / 3 - 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.bookmark_border, color: Colors.white),
        ],
      ),
    );
  }
}
