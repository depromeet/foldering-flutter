import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text("갤러리"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            title: Text("사진"),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {},
        );
      },
    );
  }
}
