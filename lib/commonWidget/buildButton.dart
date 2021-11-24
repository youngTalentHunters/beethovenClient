import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class BuildButton extends StatelessWidget {
  BuildButton(
      {Key key,
      this.imageUrl,
      this.title,
      this.subTitle,
      this.type,
      this.route})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String subTitle;
  final int type;
  final String route;

  @override
  Widget build(BuildContext context) {
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
            Get.toNamed(route ?? "/ScaleDetailPage",
                arguments: {"type": type ?? 0});
          },
        ),
      ),
    );
  }
}
