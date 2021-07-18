import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageNetWork extends StatefulWidget {
  const ImageNetWork(
      {Key? key,
      required this.urlImage,
      this.heightImage,
      this.widthImage,
      this.fitImage,
      this.boxImageSearch,
      this.sizeIconError,
      this.sizeTextError})
      : super(key: key);
  final String urlImage;
  final double? heightImage;
  final double? widthImage;
  final BoxFit? fitImage;
  final double? sizeIconError;
  final double? sizeTextError;
  final bool? boxImageSearch;

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
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
              size: widget.sizeIconError ?? 80,
            ),
            Text("Error loading image!",
                style: TextStyle(
                    color: Colors.white, fontSize: widget.sizeTextError ?? 16))
          ],
        ),
      ),
    );
  }

  Widget _containerCustom() {
    if (widget.boxImageSearch != null && widget.boxImageSearch == true) {
      return _containerSearchImage();
    }
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(53, 53, 53, 1),
      child: widget.widthImage == null && widget.heightImage == null
          ? _containerImage()
          : widget.widthImage == null && widget.heightImage != null
              ? _containerImageHeight()
              : _containerImageWidthHeight(),
    );
  }

  Widget _containerImage() {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: widget.urlImage,
      fit: widget.fitImage ?? BoxFit.cover,
    );
  }

  Widget _containerImageHeight() {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: widget.urlImage,
      fit: widget.fitImage ?? BoxFit.cover,
      height: widget.heightImage,
    );
  }

  Widget _containerImageWidthHeight() {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: widget.urlImage,
      fit: widget.fitImage ?? BoxFit.cover,
      height: widget.heightImage,
      width: widget.widthImage,
    );
  }

  Widget _containerSearchImage() {
    return ClipRRect(
        child: Container(
      color: Color.fromRGBO(53, 53, 53, 1),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: widget.urlImage,
        fit: widget.fitImage ?? BoxFit.fitHeight,
      ),
    ));
  }

  Widget _containerLoading() {
    const circularProgressIndicator =
        CircularProgressIndicator(color: Colors.white);
    return Container(
      alignment: Alignment.center,
      child: circularProgressIndicator,
    );
  }

}
