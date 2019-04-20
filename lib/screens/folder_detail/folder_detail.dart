import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/folder_detail/folder_contents.dart';
import 'package:foldering/screens/common/add_button.dart';

class DetailedScreen extends StatelessWidget {
  final String title;

  DetailedScreen({@required this.title});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildFolderingAppBar(),
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

  Column buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FolderHeader(
          title: this.title,
          isOdd: true,
          isDetailView: true,
        ),
        SizedBox(height: 24.0),
        Hero(
          tag: this.title + "body",
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              DataCategory(),
              SizedBox(height: 32.0),
              FolderContents(category: ContentCategory.all),
            ],
          ),
        ),
      ],
    );
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
