import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/folder_detail/folder_detail.dart';
import 'package:foldering/screens/common/foldering_folder.dart';
import 'package:foldering/screens/common/add_button.dart';
import 'package:foldering/screens/common/zero_padding_icon.dart';
import 'package:foldering/models/folder_info.dart';

import 'package:foldering/blocs/navigation_bloc.dart';
import 'package:foldering/blocs/appbar_bloc.dart';

void main() {
  timeDilation = 2.0;
  runApp(MyApp());
}

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
          supportedLocales: [
            const Locale('en'),
            const Locale('ko'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
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
  ScrollController outerScrollController = ScrollController();
  ScrollController innerScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _navBloc = BlocProvider.of<NavigationBloc>(context);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            buildMainContent(),
            AddButton(
              icon: ZeroPaddingIcon(
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

  Widget buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        buildFolderingAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final title = "UX Design $index";
              final headerInfo = FolderInfo(
                folderIndex: index,
                isOdd: (index % 2 == 0),
                title: title,
              );
              return Container(
                color: CupertinoColors.white,
                child: Hero(
                  tag: title + '$index-hero',
                  child: FolderHeader(folderInfo: headerInfo),
                  transitionOnUserGestures: true,
                  flightShuttleBuilder:
                      (flight, animation, direction, from, to) {
                    return SizeTransition(
                      sizeFactor:
                          animation.drive(CurveTween(curve: Curves.easeIn)),
                      child: Container(
                        child: direction == HeroFlightDirection.push
                            ? to.widget
                            : from.widget,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
