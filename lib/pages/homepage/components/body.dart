import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beethoven/constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            color: mainColor,
            // image: DecorationImage(
            //   image: Image.asset(
            //     "assets/images/character_2.png",
            //   ).image,
            //   fit: BoxFit.fitHeight,
            // ),
          ),
          child: Container(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/character_2.png",
              width: 150,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VerticalSpacing(of: 50),
                  Text(
                    "Beethoven",
                    style: TextStyle(
                        fontFamily: "NanumPen",
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(of: 10),
                  Text(
                    "음악 영재 만들기 시스템",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(of: 10),
                  SizedBox(
                    width: size.width * .6, // it just take 60% of total width
                    child: Text(
                      "아두이노 피아노와 함께 음악을 배워봐요~",
                    ),
                  ),
                  VerticalSpacing(of: 100),
                  buildButton("assets/images/scaleImage.png", "건반 따라서 연습하기",
                      "1단계 도전하기", "/ScalePracticePage"),
                  VerticalSpacing(of: 30),
                  buildButton("assets/images/sheetImage.jpeg", "악보 보면서 연습하기",
                      "2단계 도전하기", "/SheetPracticePage"),
                  VerticalSpacing(of: 30),
                  buildButton("assets/images/RecordImage.png", "녹음하며 멜로디 구성하기",
                      "3단계 도전하기", "/InitPage")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildButton(
    String imageUrl, String title, String subTitle, String route) {
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
          title ?? "녹음하며 멜로디 구성하기",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subTitle ?? "3단계 도전하기"),
        onTap: () {
          Get.toNamed(route ?? "/InitPage");
        },
      ),
    ),
  );
}
