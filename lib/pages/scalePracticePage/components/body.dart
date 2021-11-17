import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beethoven/constants.dart';

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
            "연주할 곡을 선택하세요!",
            style: TextStyle(fontSize: 30, fontFamily: "Nanumpen"),
          ),
          VerticalSpacing(of: 30),
          buildButton("assets/images/bearcharacter.png", "1. 곰세마리",
              "곰 세마리가 한 집에 있어 ...", 0),
          VerticalSpacing(of: 30),
          buildButton("assets/images/starcharacter.png", "2. 작은별",
              "반짝반짝 작은별 아름답게 비치네 ...", 1),
          VerticalSpacing(of: 30),
          buildButton("assets/images/bellcharacter.jpg", "3. 학교 종",
              "학교 종이 땡땡땡 어서 모이자 ...", 2),
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
          width: getProportionateScreenWidth(75),
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
