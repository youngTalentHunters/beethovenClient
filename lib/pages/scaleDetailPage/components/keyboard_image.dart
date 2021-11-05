import 'dart:async';

import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

class KeyboardImage extends StatefulWidget {
  List scales;
  int timepos;
  String scaleImageUrl;
  KeyboardImage({Key key, this.scales, this.timepos, this.scaleImageUrl})
      : super(key: key);

  @override
  _KeyboardImageState createState() => _KeyboardImageState();
}

class _KeyboardImageState extends State<KeyboardImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        width: getProportionateScreenWidth(400),
        height: getProportionateScreenHeight(200),
        image: AssetImage(this.widget.scales[this.widget.timepos]["image"]),
        fit: BoxFit.fill,
      ),
    );
  }
}
