import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foldering/screens/folder_detail/folder_detail.dart';

const handleHeight = 25.0;
const handleWidth = 56.0;
const handlePadding = 10.0;
const oddHandleOffset = 275.0;
const evenHandleOffset =
    oddHandleOffset - ((handleWidth + handlePadding * 2) / 2);
const headerHeight = 57.0;

class FolderHeader extends StatelessWidget {
  final bool isOdd;
  final bool isShared;
  final String title;
  final bool isDetailView;

  FolderHeader({
    @required this.isOdd,
    this.isShared = false,
    @required this.title,
    this.isDetailView = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (isDetailView) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_context) {
                return DetailedScreen(
                  title: this.title,
                );
              },
            ),
          );
        }
      },
      child: SizedBox(
        width: screenWidth,
        height: headerHeight + handleHeight,
        child: ShadowContainer(
          isOdd: this.isOdd,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: (handleHeight / (headerHeight + handleHeight) * 10000)
                      .round(),
                  child: Container(child: Row()),
                ),
                Expanded(
                  flex: (headerHeight / (headerHeight + handleHeight) * 10000)
                      .round(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          this.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          isDetailView
                              ? FontAwesomeIcons.angleUp
                              : FontAwesomeIcons.angleDown,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          clipper: HeaderClipper(isOdd: this.isOdd),
          shadow: Shadow(
            offset: Offset(0.0, -1.0),
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  final bottomPading;
  final isOdd;
  HeaderClipper({this.bottomPading = 0, @required this.isOdd});
  @override
  Path getClip(Size size) {
    final handleOffset = isOdd ? oddHandleOffset : evenHandleOffset;
    final path = Path();
    path.moveTo(0.0, handleHeight);
    path.lineTo(handleOffset, handleHeight);
    path.lineTo(handleOffset + handlePadding, 0.0);
    path.lineTo(handleOffset + handlePadding + handleWidth, 0.0);
    path.lineTo(
      handleOffset + handlePadding * 2 + handleWidth,
      handleHeight,
    );
    path.lineTo(size.width, handleHeight);
    path.lineTo(size.width, handleHeight + headerHeight - bottomPading);
    path.lineTo(0.0, handleHeight + headerHeight - bottomPading);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShadowContainer extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;
  final bool isOdd;
  ShadowContainer(
      {@required this.child,
      @required this.clipper,
      @required this.shadow,
      @required this.isOdd});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: HeaderClipper(
          bottomPading: 10,
          isOdd: this.isOdd,
        ),
        shadow: this.shadow,
      ),
      child: ClipPath(
        child: child,
        clipper: this.clipper,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
