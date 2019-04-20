import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        GridView.extent(
          maxCrossAxisExtent: 2,
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
