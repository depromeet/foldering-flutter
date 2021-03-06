import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './add_button.dart';

enum ContentCategory { all, photo, url, text }

class DataCategory extends StatelessWidget {
  const DataCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildCategoryTitle("All"),
        SizedBox(width: 16.0),
        buildCategoryTitle("Photo"),
        SizedBox(width: 16.0),
        buildCategoryTitle("URL"),
        SizedBox(width: 16.0),
        buildCategoryTitle("Text"),
        Expanded(
          flex: 10,
          child: Container(),
        ),
        SizedBox(
          height: 12.0,
          child: CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: buildCategoryTitle("ADD"),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return AddItemActionSheet();
                },
              );
            },
            minSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget buildCategoryTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

class Panel extends StatelessWidget {
  final sidePadding = 16.0;
  final textRatio = 74.0 / 164.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = (width - sidePadding * 3) / 2;
    var vPadding = width - (2 * width * textRatio);
    vPadding /= 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildPhoto(width),
            SizedBox(height: 16.0),
            buildPhoto(width),
          ],
        ),
        SizedBox(width: 16.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildLink(width),
            SizedBox(height: 16.0),
            buildPhoto(width),
            SizedBox(height: 16.0),
            buildText(width),
          ],
        ),
      ],
    );
  }

  Container buildText(double width) {
    return Container(
      width: width,
      height: width * textRatio,
      color: Colors.grey,
      child: Text("텍스트"),
    );
  }

  Container buildLink(double width) {
    return Container(
      width: width,
      height: width * textRatio,
      color: Colors.grey,
      child: Text("링크"),
    );
  }

  Container buildPhoto(double width) {
    return Container(
      width: width,
      height: width,
      color: Colors.grey,
      child: Text("사 진"),
    );
  }
}
