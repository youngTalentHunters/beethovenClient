import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class ScaleDetailPage extends StatelessWidget {
  const ScaleDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int type = Get.arguments["type"] ?? 0;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "건반 따라서 연습하기",
          style: TextStyle(fontFamily: "NanumPen", fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Body(type: type),
    );
  }
}
