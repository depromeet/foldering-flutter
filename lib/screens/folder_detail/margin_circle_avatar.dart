import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MarginCircleAvatar extends StatelessWidget {
  final double size;
  final Image image;
  final double marginSize;

  MarginCircleAvatar({
    @required this.size,
    this.image,
    @required this.marginSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: CupertinoColors.white,
      ),
      padding: EdgeInsets.all(this.marginSize),
      width: this.size,
      height: this.size,
      child: CircleAvatar(
        radius: this.size / 2.0,
        child: CircleAvatar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          child: this.image,
        ),
      ),
    );
  }
}
