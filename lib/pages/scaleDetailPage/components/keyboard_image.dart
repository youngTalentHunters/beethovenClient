import 'dart:async';

import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

class KeyboardImage extends StatefulWidget {
  const KeyboardImage({Key key}) : super(key: key);

  @override
  _KeyboardImageState createState() => _KeyboardImageState();
}

class _KeyboardImageState extends State<KeyboardImage> {
  int _timepos = 0;
  Timer _timer;
  int _start = 10;
  List photos = [
    {"image": "assets/images/dog.jpg", "time": 2},
    {"image": "assets/images/piano.png", "time": 1},
    {"image": "assets/images/jeju.jpg", "time": 5},
    {"image": "assets/images/pizza.jpg", "time": 4},
  ];

  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  void startTimer() {
    Future.delayed(Duration(milliseconds: photos[_timepos]["time"] * 1000), () {
      print("hii");
    });
  }

  @override
  void initState() {
    // isloading이나 그런거 추가해야할듯.
    _timer = Timer.periodic(
        new Duration(seconds: photos[_timepos]["time"]),
        (Timer timer) => {
              startTimer(),
              setState(() {
                if (photos.length < _timepos + 3) {
                  timer.cancel();
                }
                // print(_timepos);
                _timepos++;
              })
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        width: getProportionateScreenWidth(400),
        image: AssetImage(photos[_timepos]["image"]),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
