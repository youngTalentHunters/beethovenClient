import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: getProportionateScreenWidth(414),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "음계를 보면서 연주할 곡을 선택하세요!",
            style: TextStyle(fontSize: 18),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/ScaleDetailPage", arguments: {"type": 0});
            },
            child: Text(
              '1. 곰 세마리',
            ),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/ScaleDetailPage", arguments: {"type": 1});
            },
            child: Text('2. 작은별'),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/ScaleDetailPage", arguments: {"type": 2});
            },
            child: Text('3. 학교 종'),
          ),
        ],
      ),
    );
  }
}
