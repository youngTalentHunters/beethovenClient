import 'package:flutter/material.dart';

import 'components/body.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("베토벤 프로젝트"),
          centerTitle: true,
        ),
        body: Body());
  }
}
