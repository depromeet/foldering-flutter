import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

double firstPaddingRatio = 72.0 / 667;
double widthRatio = 310.0 / 375.0;
double heightRatio = 310.0 / 667.0;

class FolderingEmptyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (context) {
          return Container(
            color: Color.fromRGBO(235, 235, 235, 1.0),
            child: SafeArea(
              child: Center(
                child: Container(
                  height: height * heightRatio,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            FolderingFirst(
                              image: AssetImage('images/splash.png'),
                              index: 0,
                            ),
                            FolderingFirst(
                              image: AssetImage('images/second_screen.png'),
                              index: 1,
                            ),
                            FolderingFirst(
                              image: AssetImage('images/third_screen.png'),
                              index: 2,
                            ),
                          ],
                        ),
                      ),
                      TabPageSelector(
                        selectedColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

double imageSizeRatio = 140.0 / 375.0;

class FolderingFirst extends StatelessWidget {
  final AssetImage image;
  final int index;
  FolderingFirst({
    this.image,
    this.index,
  });

  final List<List<TextSpan>> introText = [
    [
      TextSpan(text: "폴더링을 찾아 주셔서 감사합니다!"),
    ],
    [
      TextSpan(text: "중요한 사진, 텍스트, 링크를 저장하고\n"),
      TextSpan(text: "원하는 대로 구성할 수 있습니다."),
    ],
    [
      TextSpan(text: "로그인을 하면 공유 기능도 사용할 수 있습니다.\n"),
      TextSpan(text: "아래의 버튼을 눌러 지금 시작해보세요!"),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: image,
            width: width * imageSizeRatio,
          ),
          SizedBox(height: height * firstPaddingRatio),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
              children: introText[this.index],
            ),
          ),
        ],
      ),
    );
  }
}
