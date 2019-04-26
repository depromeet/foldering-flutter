import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/common/foldering_folder.dart';
import 'package:foldering/screens/common/add_button.dart';
import 'package:foldering/screens/common/zero_padding_icon.dart';
import 'package:foldering/screens/folder_detail/bottom_share_bar.dart';
import 'package:foldering/screens/folder_detail/margin_circle_avatar.dart';

import 'package:foldering/models/folder_info.dart';

class DetailedScreen extends StatefulWidget {
  final FolderInfo folderInfo;

  DetailedScreen({@required this.folderInfo});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            buildMainContent(),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return NestedScrollView(
      headerSliverBuilder: (context, isInnerScrolled) {
        return [
          buildFolderingAppBar(pinned: false),
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverToBoxAdapter(child: SizedBox(height: 0.0)),
          ),
        ];
      },
      body: Hero(
        tag: widget.folderInfo.title + '${widget.folderInfo.folderIndex}-hero',
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                var nvs = context.ancestorWidgetOfExactType(NestedScrollView);
                return CustomScrollView(
                  slivers: <Widget>[
                    nvs != null
                        ? SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          )
                        : SliverToBoxAdapter(
                            child: SizedBox(height: 0.0),
                          ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverPersistentHeaderDelegate(
                        minHeight: totalHeight + 57,
                        maxHeight: totalHeight + 57,
                        child: Hero(
                          tag: widget.folderInfo.title + 'header',
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: CupertinoColors.white,
                                child: FolderHeader(
                                  folderInfo: widget.folderInfo
                                      .copyWith(isDetailView: true),
                                ),
                              ),
                              Container(
                                color: CupertinoColors.white,
                                padding: EdgeInsets.all(16.0),
                                child: DataCategory(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index < 3)
                            return Container(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              color: CupertinoColors.white,
                              child: Panel(),
                            );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: BottomShareBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate({
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
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
