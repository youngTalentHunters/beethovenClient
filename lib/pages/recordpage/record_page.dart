import 'package:flutter/material.dart';

import 'components/body.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("녹음하며 멜로디 구성하기"),
      ),
      body: Body(),
    );
  }
}
