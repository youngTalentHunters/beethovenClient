import 'package:beethoven/commonWidget/buildButton.dart';
import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/constants.dart';
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
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/sheetImage.jpeg"),
          ),
          Text(
            "악보 보면서 연주할 곡을 선택하세요!",
            style: TextStyle(fontSize: 30, fontFamily: "Nanumpen"),
          ),
          VerticalSpacing(of: 30),
          BuildButton(
              imageUrl: "assets/images/bearcharacter.png",
              title: "1. 곰세마리",
              subTitle: "곰 세마리가 한 집에 있어 ...",
              type: 0,
              route: "/SheetDetailPage"),
          VerticalSpacing(of: 30),
          BuildButton(
              imageUrl: "assets/images/starcharacter.png",
              title: "2. 작은별",
              subTitle: "반짝반짝 작은별 아름답게 비치네 ...",
              type: 1,
              route: "/SheetDetailPage"),
          VerticalSpacing(of: 30),
          BuildButton(
              imageUrl: "assets/images/bellcharacter.jpg",
              title: "3. 학교 종",
              subTitle: "학교 종이 땡땡땡 어서 모이자 ...",
              type: 2,
              route: "/SheetDetailPage"),
          VerticalSpacing(of: 50),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed("/TestPage", arguments: {"type": 2});
          //   },
          //   child: Text('기능 3번 테스트 페이지'),
          // ),
        ],
      ),
    );
  }
}

Widget buildButton(String imageUrl, String title, String subTitle, int type) {
  return Container(
    width: getProportionateScreenWidth(370),
    height: getProportionateScreenHeight(100),
    padding: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 17),
          blurRadius: 23,
          spreadRadius: -13,
          color: kShadowColor,
        ),
      ],
    ),
    child: Container(
      width: getProportionateScreenWidth(300),
      child: ListTile(
        leading: Image.asset(
          imageUrl ?? "assets/images/RecordImage.png",
          width: getProportionateScreenWidth(50),
          fit: BoxFit.fill,
        ),
        title: Text(
          title ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subTitle ?? ""),
        onTap: () {
          Get.toNamed("/ScaleDetailPage", arguments: {"type": type ?? 0});
        },
      ),
    ),
  );
}
