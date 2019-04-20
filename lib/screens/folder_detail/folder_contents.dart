import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum ContentCategory { all, photo, url, text }

class FolderContents extends StatelessWidget {
  final ContentCategory category;
  FolderContents({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: MediaQuery.of(context).size.height,
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, idx) {
          return Panel();
        },
        itemCount: 2,
      ),
    );
  }
}

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            buildPhoto(),
            buildPhoto(),
          ],
        ),
        Column(
          children: <Widget>[
            buildLink(),
            buildPhoto(),
            buildText(),
          ],
        ),
      ],
    );
  }

  Container buildText() {
    return Container(
      width: 164,
      height: 74,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("텍스트"),
    );
  }

  Container buildLink() {
    return Container(
      width: 164,
      height: 74,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("링크"),
    );
  }

  Container buildPhoto() {
    return Container(
      width: 164,
      height: 164,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("사 진"),
    );
  }
}
