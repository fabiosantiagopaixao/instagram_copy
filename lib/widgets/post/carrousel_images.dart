import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/widgets/post/footer_post.dart';
import 'package:instagram_copy/widgets/post/header_post.dart';
import 'package:instagram_copy/widgets/image_network.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  String _currentLabel = '';
   int _currentIndex = 0;

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
    children.add(getCarousel());
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold)),
        ),
      ));
    }
    return Stack(children: children);
  }

  Widget getCarousel() {
    final double height = 400;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          HeaderPost(post: widget.post),
          CarouselSlider(
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentLabel = '${index + 1}/${widget.post.images.length}';
                    _currentIndex = index;
                  });
                }),
            items: widget.post.images
                .map((item) =>
                    ImageNetWork(urlImage: item.url, heightImage: height))
                .toList(),
          ),
          FooterPost(post: widget.post, currentIndex: _currentIndex,),
        ],
      ),
    );
  }
}
