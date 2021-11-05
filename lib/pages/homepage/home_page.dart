import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  final server;
  const HomePage({Key key, this.server}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("베토벤프로젝트"),
        brightness: Brightness.light,
      ),
      body: Body(),
    );
  }
}
