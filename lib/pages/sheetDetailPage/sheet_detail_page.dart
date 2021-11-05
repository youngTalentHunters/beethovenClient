import 'package:flutter/material.dart';

import 'components/body.dart';

class SheetDetailPage extends StatelessWidget {
  const SheetDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("악보 따라서 건반치기"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
