import 'package:beethoven/controller/mySheetDetail_controller.dart';
import 'package:beethoven/controller/mySheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class MySheetDetailPage extends StatelessWidget {
  const MySheetDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MySheetDetailController());
    String title = Get.arguments["title"];
    int sheetId = Get.arguments["rowId"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "내 악보 " + sheetId.toString(),
          style: TextStyle(fontFamily: "NanumPen", fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Body(title: title),
    );
  }
}
