import 'package:beethoven/config/scaleDB.dart';
import 'package:beethoven/config/sheetDB.dart';
import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class MySheetController extends GetxController {
  static MySheetController get to => Get.find();

  final SheetDB sheetDB = new SheetDB();
  final ScaleDB scaleDB = new ScaleDB();

  RxList<CustomSheet> customSheets = RxList<CustomSheet>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadSheet();
    super.onInit();
  }

  void insertSheet() {
    sheetDB.insertData(
      new CustomSheet(id: 2, title: "new one", createdAt: DateTime.now()),
    );
  }

  void loadSheet() async {
    List<CustomSheet> res = await sheetDB.getAllData();
    print(customSheets.isEmpty ? "원소 없음" : customSheets.last.rowId.toString());
    customSheets(res);
    isLoading(false);
  }

  void deleteSheet() {
    // rowId로 찾아서 삭제?
    sheetDB.deleteData(2);
  }

  void getSheet() {
    sheetDB.getAllData();
  }
}
