import 'dart:async';

import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/conversion.dart';
import 'package:beethoven/pages/scaleDetailPage/components/scaleWord.dart';
import 'package:flutter/material.dart';

import 'keyboard_image.dart';

class Body extends StatefulWidget {
  final int type;
  const Body({Key key, this.type}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int timepos = 0;
  Timer _timer;
  List scales;

  void startTimer() {
    _timer = Timer.periodic(
        new Duration(milliseconds: scales[timepos]["time"]),
        (Timer timer) => {
              setState(() {
                timepos++;
                timer.cancel();
              }),
              if (timepos + 2 <= scales.length)
                {
                  startTimer(),
                }
            });
  }

  @override
  void initState() {
    scales = typeToList(this.widget.type);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(414),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: getProportionateScreenHeight(200),
            width: getProportionateScreenWidth(414),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: Image.asset("assets/images/scaleTopImage.png").image,
                  fit: BoxFit.fill),
            ),
            child: Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      typeToTitle(this.widget.type),
                      style: TextStyle(fontFamily: "NanumPen", fontSize: 30),
                    ),
                  ],
                )),
          ),
          VerticalSpacing(of: 10),
          KeyboardImage(scales: scales, timepos: timepos),
          VerticalSpacing(of: 20),
          ScaleWord(timepos: timepos, scales: scales),
        ],
      ),
    );
  }
}
