import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildFolderingAppBar({
  bool pinned = true,
  Widget child,
}) {
  Key _keyForSliverAppBar = Key('main-app-bar');
  return SliverAppBar(
    key: _keyForSliverAppBar,
    floating: !pinned,
    snap: !pinned,
    pinned: pinned,
    brightness: Brightness.light,
    backgroundColor: CupertinoColors.white,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    title: Text(
      "Foldering",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.black,
      ),
    ),
    actions: [
      AppBarButton(
        icon: CupertinoIcons.search,
      ),
      AppBarButton(
        icon: CupertinoIcons.tag_solid,
      ),
      AppBarButton(
        icon: FontAwesomeIcons.ellipsisV,
      ),
    ],
    forceElevated: false,
    bottom: child,
  );
}

class AppBarButton extends StatelessWidget {
  final IconData icon;
  const AppBarButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {},
      child: Icon(
        icon,
        color: Color.fromRGBO(155, 155, 155, 1.0),
      ),
    );
  }
}
