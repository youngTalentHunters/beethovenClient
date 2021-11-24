import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showDialogGetX(
    {String title,
    @required String message1,
    String confirmText,
    VoidCallback onConfirmMethod,
    TextEditingController textController}) {
  Get.defaultDialog(
    title: title ?? "Beethoven",
    titleStyle: TextStyle(
      fontSize: getProportionateScreenWidth(35),
      height: 2,
      letterSpacing: getProportionateScreenWidth(5),
      fontWeight: FontWeight.bold,
      fontFamily: "NanumPen",
    ),
    confirm: TextButton(
      child: Text(confirmText ?? "승인"),
      onPressed: () => {
        onConfirmMethod(),
        Get.back(),
        if (textController != null) textController.clear()
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(5),
          primary: mainColor,
          textStyle: TextStyle()),
    ),
    cancel: TextButton(
      child: Text("취소"),
      onPressed: () {
        Get.back();
        if (textController != null) textController.clear();
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(5),
          primary: mainColor,
          textStyle: TextStyle()),
    ),
    radius: 5,
    content: Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Text(
              message1,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  letterSpacing: getProportionateScreenWidth(2)),
            )),
        VerticalSpacing(),
        textController == null
            ? Container()
            : Container(
                height: getProportionateScreenHeight(55),
                width: getProportionateScreenWidth(250),
                child: TextFormField(
                  controller: textController,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Color(0xff363636)),
                  decoration: InputDecoration(
                    hintText: "파일 제목을 입력하세요",
                    hintStyle: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        color: Color(0xff848484),
                        fontFamily: "SCDream4"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                  ),
                ),
              ),
      ],
    ),
  );
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      fontSize: 15.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
