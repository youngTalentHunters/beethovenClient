import 'package:beethoven/config/scaleDB.dart';
import 'package:beethoven/config/sheetDB.dart';
import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class HomeController extends GetxService {
  static HomeController get to => Get.find();

  BluetoothDevice device;
  final SheetDB sheetDB = new SheetDB();
  final ScaleDB scaleDB = new ScaleDB();

  void insertScale() {
    scaleDB.insertData(
      new CustomScale(
          sheetId: 2,
          text: "mi",
          imageUrl: "assets/images/scale/2.png",
          createdAt: DateTime.now()),
    );
  }

  void printScale() async {
    List<CustomScale> customScales = await scaleDB.getAllDataBySheetId(2);
    print(customScales.isEmpty
        ? "원소 없음"
        : customScales.last.createdAt.toString());
  }

  void deleteScale() {
    scaleDB.deleteDataBySheetId(2);
  }

  void insertSheet() {
    sheetDB.insertData(
      new CustomSheet(id: 2, title: "new one", createdAt: DateTime.now()),
    );
  }

  void deleteSheet(int rowId) {
    sheetDB.deleteData(rowId);
  }

  void printSheet() async {
    List<CustomSheet> customSheets = await sheetDB.getAllData();
    print(customSheets.isEmpty ? "원소 없음" : customSheets.last.rowId.toString());
  }
}
