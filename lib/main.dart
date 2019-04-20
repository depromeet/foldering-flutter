import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoApp(
        home: FolderingHome(),
        title: "Foldering",
      ),
    );
  }
}

class FolderingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        backgroundColor: Colors.white,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Foldering",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
              child: Icon(
                CupertinoIcons.search,
                color: Color.fromRGBO(155, 155, 155, 1.0),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
              child: Icon(
                CupertinoIcons.tag_solid,
                color: Color.fromRGBO(155, 155, 155, 1.0),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.ellipsisV,
                color: Color.fromRGBO(155, 155, 155, 1.0),
              ),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemBuilder: (_context, _idx) {
            return FolderHeader(
              isOdd: _idx % 2 == 0,
              title: "UX 디자인 노트",
            );
          },
          itemCount: 10,
          padding: EdgeInsets.only(top: 5.0),
        ),
      ),
    );
  }
}
