import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconPosition extends StatelessWidget {
  const IconPosition(
      {Key? key,
      required this.icon,
      this.positionLeft,
      this.positionTop,
      this.color,
      this.size})
      : super(key: key);
  final IconData icon;
  final double? positionLeft;
  final double? positionTop;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop ?? 8.0,
      left: positionLeft ?? 103.0,
      child: Container(
        height: size ?? 18.0,
        width: size ?? 18.0,
        child: Icon(
          icon,
          color: color ?? Colors.white,
          size: size ?? 18.0,
        ),
      ),
    );
  }
}
