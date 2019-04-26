import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:foldering/screens/common/foldering_app_bar.dart';
import 'package:foldering/screens/folder_header/folder_header.dart';
import 'package:foldering/screens/common/add_button.dart';
import 'package:foldering/screens/empty_home/empty_home.dart';
import 'package:foldering/models/folder_info.dart';

import 'package:foldering/blocs/folder_bloc.dart';

class TestBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
  }
}

void main() {
  timeDilation = 1.0;
  BlocSupervisor().delegate = TestBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static FolderBloc _folderBloc = FolderBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<FolderBloc>(bloc: _folderBloc),
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
            const FallbackCupertinoLocalisationsDelegate(),
          ],
          home: Builder(
            builder: (context) {
              return FolderingHome();
            },
          ),
          title: "Foldering",
        ),
      ),
    );
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class FolderingHome extends StatefulWidget {
  @override
  _FolderingHomeState createState() => _FolderingHomeState();
}

class _FolderingHomeState extends State<FolderingHome> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FolderBloc>(context).dispatch(
      FolderAction(
        event: FolderEvent.getAllFolders,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            FolderHomeList(),
            AddFolderButton(),
          ],
        ),
      ),
    );
  }
}

class FolderHomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _folderBloc = BlocProvider.of<FolderBloc>(context);
    return BlocBuilder(
      bloc: _folderBloc,
      builder: (BuildContext context, FolderData data) {
        List<FolderInfo> folders = data.data;
        print("Build ${folders?.length} items with status ${data.status}");
        if (data.status == FolderServiceState.isLoaded && folders == null) {
          return FolderingEmptyHome();
        } else {
          return CustomScrollView(
            slivers: <Widget>[
              buildFolderingAppBar(pinned: true),
              (data.status == FolderServiceState.isLoading)
                  ? SliverToBoxAdapter(
                      child: Container(
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, listIndex) {
                          int index = listIndex;
                          if (index < folders.length) {
                            final folderInfo = folders[index].copyWith(
                              isOdd: (index % 2 == 0),
                              folderIndex: index,
                            );
                            return Container(
                              color: CupertinoColors.white,
                              child: Hero(
                                tag: folderInfo.title + '$index-hero',
                                child: FolderHeader(folderInfo: folderInfo),
                                transitionOnUserGestures: true,
                                flightShuttleBuilder:
                                    (flight, animation, direction, from, to) {
                                  return SizeTransition(
                                    sizeFactor: animation.drive(
                                        CurveTween(curve: Curves.easeIn)),
                                    child: Transform(
                                      transform: Matrix4.translationValues(
                                          0.0, 0.0, -10.0),
                                      child: Container(
                                        child: direction ==
                                                HeroFlightDirection.push
                                            ? to.widget
                                            : from.widget,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else if (data.status ==
                                  FolderServiceState.isAdding &&
                              index == folders.length) {
                            return CupertinoActivityIndicator();
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
            ],
          );
        }
      },
    );
  }
}
