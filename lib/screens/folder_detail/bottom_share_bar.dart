import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './margin_circle_avatar.dart';

class BottomShareBar extends StatelessWidget {
  static double get height => 48.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // 공유대상 관리 페이지로 연결하기
      },
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 4.0,
              offset: Offset(0.0, -2.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: _buildCircleAvatars(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "공유대상 관리",
                  style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "SpoqaHanSansJP",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(width: 4.0),
                CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {},
                  minSize: 12.0,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: CupertinoColors.black,
                      size: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCircleAvatars() {
    return List.generate(
      5,
      (index) {
        return Positioned(
          left: 20.0 * index,
          child: MarginCircleAvatar(size: 32.0, marginSize: 3),
        );
      },
    );
  }
}
