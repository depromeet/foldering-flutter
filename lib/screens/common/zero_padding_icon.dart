import 'package:flutter/material.dart';

class ZeroPaddingIcon extends StatelessWidget {
  final IconData _iconData;
  final key;
  final size;
  final color;
  final semanticLabel;
  final textDirection;

  ZeroPaddingIcon(
    this._iconData, {
    this.size,
    this.color,
    this.key,
    this.semanticLabel,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Icon(
        _iconData,
        semanticLabel: this.semanticLabel,
        key: this.key,
        size: this.size,
        color: this.color,
        textDirection: this.textDirection,
      ),
    );
  }
}
