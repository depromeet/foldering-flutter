import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

CupertinoNavigationBar buildFolderingAppBar() {
  return CupertinoNavigationBar(
    border: null,
    transitionBetweenRoutes: true,
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
    ),
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
