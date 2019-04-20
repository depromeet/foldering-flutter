import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/folder_detail/folder_detail.dart';
import 'package:foldering/screens/common/add_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foldering/blocs/navigation_bloc.dart';
import 'package:foldering/blocs/appbar_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(bloc: NavigationBloc()),
        BlocProvider<AppBarBloc>(bloc: AppBarBloc()),
      ],
      child: Material(
        child: CupertinoApp(
          home: FolderingHome(),
          title: "Foldering",
        ),
      ),
    );
  }
}

class FolderingHome extends StatefulWidget {
  @override
  _FolderingHomeState createState() => _FolderingHomeState();
}

class _FolderingHomeState extends State<FolderingHome> {
  NavigationBloc _navBloc;
  @override
  Widget build(BuildContext context) {
    _navBloc = BlocProvider.of<NavigationBloc>(context);

    return CupertinoPageScaffold(
      navigationBar: buildFolderingAppBar(),
      child: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              itemBuilder: (_context, _idx) {
                final title = "UX 디자인 노트 $_idx";
                return Column(
                  children: <Widget>[
                    FolderHeader(
                      isOdd: _idx % 2 == 0,
                      title: title,
                    ),
                    Hero(
                      tag: title + "body",
                      child: BlocBuilder(
                        bloc: _navBloc,
                        builder: (context, control) {
                          return control == NavigationEvent.toMainStart
                              ? DataCategory()
                              : Container();
                        },
                      ),
                    ),
                  ],
                );
              },
              itemCount: 10,
              padding: EdgeInsets.only(top: 5.0),
            ),
            AddButton(
              icon: Icon(
                Icons.folder,
                size: 30.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
