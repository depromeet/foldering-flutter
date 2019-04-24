import 'package:flutter/material.dart';

class ShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("공유대상 관리"),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_context, _idx) {
              return Container(
                width: 64,
                height: 64,
                color: Colors.indigo,
                margin: EdgeInsets.all(8.0),
              );
            },
          ),
          Divider(),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_context, _idx) {
              return Container(
                width: 64,
                height: 64,
                color: Colors.indigo,
                margin: EdgeInsets.all(8.0),
              );
            },
          ),
        ],
      ),
    );
  }
}
