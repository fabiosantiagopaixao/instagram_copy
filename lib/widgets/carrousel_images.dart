import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/widgets/image_network.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int _currentIndex = 0;
  String _currentLabel = '';

  @override
  void initState() {
    super.initState();
    _currentLabel = '1/${widget.post.images.length}';
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
    if (widget.post.images.length > 1) {
      children.add(Positioned(
        top: 80.0,
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
          _getHeader(),
          CarouselSlider(
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    _currentLabel = '${index + 1}/${widget.post.images.length}';
                  });
                }),
            items: widget.post.images
                .map(
                    (item) => ImageNetWork(urlImage: item, heigthImage: height))
                .toList(),
          ),
          _getFooter()
        ],
      ),
    );
  }

  _getHeader() {
    return Row(
      children: [
        Container(
          width: 40.0,
          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          decoration: new BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white10,
                  Colors.white30,
                ]),
          ),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(widget.post.imageUser),
            backgroundColor: Colors.transparent,
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery
              .of(context)
              .size
              .width - 79,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.username,
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text(widget.post.location ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.more_vert, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }

  Widget _getFooter() {
    final children = <Widget>[];
    children.add(_getActions());
    if (widget.post.images.length > 1) {
      children.add(_getStatusSlide());
    }
    children.add(_getActionSave());

    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
      child: Row(
        children: children,
      ),
    );
  }

  Widget _getActions() {
    return Container(
      width: widget.post.images.length == 1
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

  Widget _getStatusSlide() {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.post.images.map((url) {
          int index = widget.post.images.indexOf(url);
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

  Widget _getActionSave() {
    return Container(
      width: widget.post.images.length == 1
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
