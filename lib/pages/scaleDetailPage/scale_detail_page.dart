import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class ScaleDetailPage extends StatelessWidget {
  const ScaleDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String type = Get.arguments["type"].toString() ?? "0";
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("음계 따라서 건반치기"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
