import 'package:flutter/material.dart';

import 'components/body.dart';

class ScalePracticePage extends StatelessWidget {
  const ScalePracticePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("음계 따라서 건반치기"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
