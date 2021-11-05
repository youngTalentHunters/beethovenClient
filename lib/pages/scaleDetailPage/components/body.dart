import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'keyboard_image.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(414),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [VerticalSpacing(of: 30), Text("곰세마리"), KeyboardImage()],
      ),
    );
  }
}
