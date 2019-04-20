import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Material(
        child: FolderingHome(),
      ),
      title: "Foldering",
    );
  }
}

class FolderingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Foldering",
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
      child: Material(
        child: ListView.builder(
          itemBuilder: (_context, _idx) {
            return ExpansionTile(
              title: Text("Test"),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("All"),
                    Text("Photo"),
                    Text("URL"),
                    Text("Text"),
                  ],
                ),
                Container(
                  height: 500.0,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1.0,
                    ),
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text("사진"),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text("사진"),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text("사진"),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text("사진"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
