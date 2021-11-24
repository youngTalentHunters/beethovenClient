import 'package:beethoven/config/scaleDB.dart';
import 'package:beethoven/config/sheetDB.dart';
import 'package:beethoven/conversion.dart';
import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class RecordController extends GetxController {
  static RecordController get to => Get.find();

  final SheetDB sheetDB = new SheetDB();
  final ScaleDB scaleDB = new ScaleDB();

  RxInt currentScale = 10.obs; // 현재 눌리고 있는 건반

  @override
  void onInit() {
    // 1. 새로운 악보 만들기
    // insertSheet();
    super.onInit();
  }

  // 음계 입력
  void insertScale(List<int> scales, int rowId) {
    // 현재 sheetId에 해당되는 모든 음계 저장
    scales.forEach((scale) {
      scaleDB.insertData(
        new CustomScale(
            sheetId: rowId,
            text: valueToStringScale(scale),
            imageUrl: "assets/images/scale/" + scale.toString() + ".png",
            createdAt: DateTime.now()),
      );
    });
  }

  Future<int> insertSheet(String title) async {
    int rowId = await sheetDB.insertData(
      new CustomSheet(id: 2, title: title, createdAt: DateTime.now()),
    );
    print("새로운 sheet 추가" + rowId.toString());
    // ** sheetId 변경
    return rowId;
  }

  void setCurrentScale(int scale) {
    currentScale(scale);
  }
}
