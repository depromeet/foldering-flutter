import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/folder_detail/folder_contents.dart';
import 'package:foldering/screens/common/add_button.dart';

class DetailedScreen extends StatefulWidget {
  final String title;

  DetailedScreen({@required this.title});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            buildMainContent(),
            AddButton(
              icon: Icon(
                Icons.add,
                color: Colors.grey[600],
                size: 36.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
//          heroTag: "Nothing",
          backgroundColor: Colors.white,
          automaticallyImplyTitle: true,
//          largeTitle: Text(""),
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
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: headerHeight + handleHeight,
            maxHeight: headerHeight + handleHeight,
            child: FolderHeader(
              title: this.widget.title,
              isOdd: true,
              isDetailView: true,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 24.0),
        ),
//        Hero(
//          tag: this.widget.title + "body",
//          child: Column(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              DataCategory(),
//              SizedBox(height: 32.0),
//              FolderContents(category: ContentCategory.all),
//            ],
//          ),
//        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class DataCategory extends StatelessWidget {
  const DataCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildCategoryTitle("All"),
        buildCategoryTitle("Photo"),
        buildCategoryTitle("URL"),
        buildCategoryTitle("Text"),
      ],
    );
  }

  Widget buildCategoryTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}
