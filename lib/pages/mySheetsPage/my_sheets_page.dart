import 'package:beethoven/controller/mySheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class MySheetsPage extends StatelessWidget {
  const MySheetsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MySheetController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "내가 직접 만든 곡",
            style: TextStyle(fontFamily: "NanumPen", fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Body());
  }
}
