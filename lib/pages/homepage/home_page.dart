import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:beethoven/constants.dart';

class HomePage extends StatelessWidget {
  final server;
  const HomePage({Key key, this.server}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: Body());
  }
}
