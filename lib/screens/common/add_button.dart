import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../add_item/add_photo.dart';

import '../../blocs/folder_bloc.dart';

class AddFolderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FolderBloc>(context);
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: Container(
        width: 64.0,
        height: 64.0,
        decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.grey[300],
            shadows: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 7.0),
                blurRadius: 10,
              ),
            ]),
        child: CupertinoButton(
          child: Icon(
            FontAwesomeIcons.folderPlus,
            size: 30.0,
            color: Colors.grey[600],
          ),
          onPressed: () async {
            String title = await showCupertinoDialog(
              context: context,
              builder: (context) {
                return AddFolderActionSheet();
              },
            );
            if (title != null && title.isNotEmpty) {
              bloc.dispatch(
                FolderAction(
                  event: FolderEvent.addFolder,
                  folderTitle: title,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class AddFolderActionSheet extends StatefulWidget {
  @override
  _AddFolderActionSheetState createState() => _AddFolderActionSheetState();
}

class _AddFolderActionSheetState extends State<AddFolderActionSheet> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // 곧바로 폴더 생성하는 화면으로 넘어 가야 함
    return CupertinoAlertDialog(
      title: Text("폴더 생성하기"),
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: CupertinoTextField(
          controller: _controller,
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            "취소",
          ),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          child: Text(
            "확인",
            style: CupertinoTextThemeData().actionTextStyle,
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final Widget icon;
  final double bottomPadding;

  const AddButton({
    Key key,
    @required this.icon,
    this.bottomPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0 + bottomPadding,
      right: 16.0,
      child: Container(
        width: 64.0,
        height: 64.0,
        decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.grey[300],
            shadows: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 7.0),
                blurRadius: 10,
              ),
            ]),
        child: CupertinoButton(
          child: this.icon,
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return AddItemActionSheet();
              },
            );
          },
        ),
      ),
    );
  }
}

class AddItemActionSheet extends StatelessWidget {
  const AddItemActionSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        child: Text("폴더 생성"),
        onPressed: () {},
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("사진"),
          onPressed: () async {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return AddPhoto();
                },
              ),
            );
          },
        ),
        CupertinoActionSheetAction(
          child: Text("링크"),
          onPressed: () {},
        ),
        CupertinoActionSheetAction(
          child: Text("텍스트"),
          onPressed: () {},
        ),
      ],
    );
  }
}
