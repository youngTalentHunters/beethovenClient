import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/controller/mySheet_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SheetListTile extends StatelessWidget {
  SheetListTile(
      {Key key, this.rowId, this.title, this.createdAt, this.onClicked})
      : super(key: key);

  int rowId;
  String title;
  DateTime createdAt;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClicked,
      onLongPress: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('삭제 메뉴'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                child: const Text(
                  '삭제',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  print("sheet 삭제");
                  HomeController.to.deleteSheet(rowId);
                  MySheetController.to.loadSheet();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
      leading: Text(rowId.toString()),
      title: Text(title),
      trailing: Text(DateFormat('MM/dd').add_jm().format(createdAt)),
    );
  }
}
