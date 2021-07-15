import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetWork extends StatefulWidget {
  const ImageNetWork(
      {Key? key,
      required this.urlImage,
      this.heigthImage,
      this.widthImage,
      this.fitImage})
      : super(key: key);
  final String urlImage;
  final double? heigthImage;
  final double? widthImage;
  final BoxFit? fitImage;

  @override
  _ImageNetWorkState createState() => _ImageNetWorkState();
}

class _ImageNetWorkState extends State<ImageNetWork> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.urlImage,
      imageBuilder: (context, imageProvider) => _containerCustom(),
      placeholder: (context, url) => _containerLoading(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _containerCustom() {
    return widget.widthImage == null && widget.heigthImage == null
        ? _containerImage()
        : widget.widthImage == null && widget.heigthImage != null
            ? _containerImageHeight()
            : _containerImageWidthHeight();
  }

  Widget _containerImage() {
    return Center(
      child: Image.network(
        widget.urlImage,
        fit: widget.fitImage ?? BoxFit.cover,
      ),
    );
  }

  Widget _containerImageHeight() {
    return Image.network(
      widget.urlImage,
      fit: widget.fitImage ?? BoxFit.cover,
      height: widget.heigthImage,
    );
  }

  Widget _containerImageWidthHeight() {
    return Image.network(
      widget.urlImage,
      fit: widget.fitImage ?? BoxFit.cover,
      height: widget.heigthImage,
      width: widget.widthImage,
    );
  }

  Widget _containerLoading() {
    return Container(
      child: Center(child: CircularProgressIndicator(color: Colors.white24)),
    );
  }
}
