import 'package:flutter/material.dart';

import 'components/body.dart';

class ScalePracticePage extends StatelessWidget {
  const ScalePracticePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "건반 따라서 연습하기",
          style: TextStyle(fontFamily: "NanumPen", fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
