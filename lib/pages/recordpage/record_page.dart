import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/controller/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../method.dart';
import 'components/body.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  void dispose() {
    Get.delete<RecordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(RecordController());
    return Scaffold(
      appBar: AppBar(
        title: Text("녹음하며 멜로디 구성하기"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showDialogGetX(
                message1: "뒤로 가면 저장되지 않습니다. 괜찮은가요?",
                confirmText: "뒤로 가기",
                onConfirmMethod: () {
                  Get.back();
                });
          },
        ),
      ),
      body: Body(),
    );
  }
}
