import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';

class DetailedScreen extends StatelessWidget {
  final String title;

  DetailedScreen({@required this.title});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            FolderHeader(
              title: "UX 디자인 노트",
              isOdd: true,
              isDetailView: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("All"),
                Text("Photo"),
                Text("URL"),
                Text("Text"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
