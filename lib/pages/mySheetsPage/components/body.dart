import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/controller/mySheet_controller.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:beethoven/pages/mySheetsPage/components/sheetListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => MySheetController.to.isLoading.value
        ? Container()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: MySheetController.to.customSheets.length,
            itemBuilder: (BuildContext context, int index) {
              return SheetListTile(
                  rowId: MySheetController.to.customSheets[index].rowId,
                  title: MySheetController.to.customSheets[index].title,
                  createdAt: MySheetController.to.customSheets[index].createdAt,
                  onClicked: () {
                    Get.toNamed("/MySheetDetailPage", arguments: {
                      "rowId": MySheetController.to.customSheets[index].rowId,
                      "title": MySheetController.to.customSheets[index].title,
                    });
                    print("hi");
                  });
            }));
  }
}
