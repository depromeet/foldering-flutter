import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foldering/screens/folder_detail/folder_detail.dart';
import 'package:foldering/models/folder_info.dart';

import 'package:foldering/blocs/navigation_bloc.dart';

const handleHeight = 22.0;
const handleWidth = 80.0;
const handlePadding = 11.0;
const oddHandleOffset = 20.0;
const evenHandleOffset = oddHandleOffset + (handleWidth / 2);
const totalHeight = 90.0;
const headerHeight = totalHeight - handleHeight;
const headerTitleTopPadding = 10.0;
const headerTitleLeftPadding = 16.0;

class FolderHeader extends StatelessWidget {
  final FolderInfo folderInfo;

  FolderHeader({@required this.folderInfo});

  _handleNavigation(BuildContext context, NavigationBloc _navBloc) async {
    if (this.folderInfo.isDetailView) {
      _navBloc.dispatch(NavigationEvent(
        targetFolderIndex: this.folderInfo.folderIndex,
        action: NavigationAction.toMainStart,
      ));
      Navigator.of(context).pop();
    } else {
      _navBloc.dispatch(NavigationEvent(
        targetFolderIndex: this.folderInfo.folderIndex,
        action: NavigationAction.toDetail,
      ));
      Navigator.of(context).push(
        FolderingRoute(bloc: _navBloc, folderInfo: this.folderInfo),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final NavigationBloc _navBloc = BlocProvider.of<NavigationBloc>(context);
    return GestureDetector(
      onTap: () {
        _handleNavigation(context, _navBloc);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          width: screenWidth,
          height: totalHeight,
          child: ShadowContainer(
            isOdd: this.folderInfo.isOdd,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: (handleHeight / (totalHeight) * 10000).round(),
                    child: Container(child: Row()),
                  ),
                  Expanded(
                    flex: (headerHeight / (totalHeight) * 10000).round(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: headerTitleLeftPadding,
                        top: headerTitleTopPadding,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            this.folderInfo.title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            this.folderInfo.isDetailView
                                ? FontAwesomeIcons.angleUp
                                : FontAwesomeIcons.angleDown,
                            size: 20,
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            clipper: HeaderClipper(
              isOdd: this.folderInfo.isOdd,
              mediaWidth: screenWidth,
            ),
            shadow: Shadow(
              offset: Offset(0.0, -1.0),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  final bottomPading;
  final isOdd;
  final mediaWidth;
  HeaderClipper({
    this.bottomPading = 0,
    @required this.isOdd,
    @required this.mediaWidth,
  });
  @override
  Path getClip(Size size) {
    final xHandleBottomRight =
        this.mediaWidth - (isOdd ? oddHandleOffset : evenHandleOffset);
    final xHandleTopRight = xHandleBottomRight - handlePadding;

    final xHandleTopLeft = xHandleTopRight - (handleWidth - 2 * handlePadding);
    final xHandleBottomLeft = xHandleTopLeft - handlePadding;

    final path = Path();
    path.moveTo(0.0, handleHeight);
    path.lineTo(xHandleBottomLeft, handleHeight);
    path.lineTo(xHandleTopLeft, 0.0);
    path.lineTo(xHandleTopRight, 0.0);
    path.lineTo(xHandleBottomRight, handleHeight);
    path.lineTo(size.width, handleHeight);
    path.lineTo(size.width, totalHeight - this.bottomPading);
    path.lineTo(0.0, totalHeight - this.bottomPading);
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
    final width = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: HeaderClipper(
          bottomPading: 10,
          isOdd: this.isOdd,
          mediaWidth: width,
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

class FolderingRoute extends CupertinoPageRoute {
  final NavigationBloc bloc;
  final FolderInfo folderInfo;

  FolderingRoute({
    @required this.folderInfo,
    @required this.bloc,
  }) : super(
          builder: (BuildContext context) =>
              DetailedScreen(folderInfo: folderInfo),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
