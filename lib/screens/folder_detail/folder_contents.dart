import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';

import 'package:foldering/blocs/appbar_bloc.dart';

enum ContentCategory { all, photo, url, text }

class FolderContents extends StatefulWidget {
  final ContentCategory category;
  FolderContents({this.category});

  @override
  _FolderContentsState createState() => _FolderContentsState();
}

class _FolderContentsState extends State<FolderContents> {
  ScrollController _scrollController = ScrollController();
  bool _isAppBarActivated;
  AppBarBloc _appBarBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isAppBarActivated = true;
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isAppBarActivated && _appBarBloc != null) {
            print("Scroll forward");
            _appBarBloc.dispatch(AppBarEvent.show);
            _isAppBarActivated = true;
          }
        } else {
          if (_isAppBarActivated && _appBarBloc != null) {
            print("Scroll reverse");
            _appBarBloc.dispatch(AppBarEvent.hide);
          }
          _isAppBarActivated = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _appBarBloc = BlocProvider.of<AppBarBloc>(context);
    return Container(
//      height: MediaQuery.of(context).size.height,
      height: 400,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, idx) {
          return Panel();
        },
        itemCount: 2,
      ),
    );
  }
}

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            buildPhoto(),
            buildPhoto(),
          ],
        ),
        Column(
          children: <Widget>[
            buildLink(),
            buildPhoto(),
            buildText(),
          ],
        ),
      ],
    );
  }

  Container buildText() {
    return Container(
      width: 164,
      height: 74,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("텍스트"),
    );
  }

  Container buildLink() {
    return Container(
      width: 164,
      height: 74,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("링크"),
    );
  }

  Container buildPhoto() {
    return Container(
      width: 164,
      height: 164,
      color: Colors.grey,
      margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: Text("사 진"),
    );
  }
}
