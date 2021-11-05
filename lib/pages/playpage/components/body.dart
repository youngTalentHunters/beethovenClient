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
            "베토벤 프로젝트에 오신 \n    여러분 환영합니다~",
            style: TextStyle(fontSize: 18),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/ScalePracticePage");
            },
            child: Text(
              '1. 음계 따라서 건반치기',
            ),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/SheetPracticePage");
            },
            child: Text('2. 악보 따라서 건반치기'),
          ),
          VerticalSpacing(of: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/RecordPage");
            },
            child: Text('3. 녹음하며 멜로디 구성하기'),
          ),
        ],
      ),
    );
  }
}
