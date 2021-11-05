import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/constants.dart';
import 'package:flutter/material.dart';

class ScaleWord extends StatefulWidget {
  int timepos;
  List scales;
  ScaleWord({Key key, this.timepos, this.scales}) : super(key: key);

  @override
  _ScaleWordState createState() => _ScaleWordState();
}

class _ScaleWordState extends State<ScaleWord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.widget.scales[this.widget.timepos]["scale"],
        style: TextStyle(fontSize: getProportionateScreenWidth(50)),
      ),
    );
  }
}
