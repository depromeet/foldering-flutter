import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foldering/screens/folder_detail/folder_detail.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';


class SharedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: new Container(
              height: double.infinity,
              color: Color.fromRGBO(243, 243, 243, 1.0),
              child: Stack(children: [
              
                ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 23.0,
                    ),
                    peopleList(),
                    SizedBox(
                      height: 76.0,
                    ),
                    verticalCenterItem(
                        "Copy Link", Color.fromRGBO(245, 166, 35, 1.0)),
                    SizedBox(
                      height: 34.0,
                    ),
                    verticalCenterItem(
                        "Stop Sharing", Color.fromRGBO(208, 2, 27, 1.0)),
                  ],
                ),
              ]))),
    );
  }

  Container verticalCenterItem(String name, color) {
    return Container(
      height: 42,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 17))
        ],
      ),
    );
  }

  Widget peopleList() {
    return Column(
      children: <Widget>[
        person(),
        person(),
        person(),
        person(),
        person(),
        person(),
        verticalCenterItem("Add People", Color.fromRGBO(245, 166, 35, 1.0)),
      ],
    );
  }

  Container person() {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromRGBO(235, 235, 235, 1.0)),
          ),
          color: Colors.white,
        ),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 3.0, bottom: 3.0),
        child: Row(
          children: <Widget>[
            buildAvatar(38),
            SizedBox(
              width: 22.0,
            ),
            Text(
              "User name",
              style: TextStyle(color: Color.fromRGBO(151, 151, 151, 1.0)),
            ),
            Expanded(
              flex: 10,
              child: Container(),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(176, 176, 176, 1.0),
              size: 14,
            )
          ],
        ));
  }

 
}
