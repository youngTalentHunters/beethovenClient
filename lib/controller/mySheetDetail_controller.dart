import 'package:beethoven/config/scaleDB.dart';
import 'package:beethoven/config/sheetDB.dart';
import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class MySheetDetailController extends GetxController {
  static MySheetDetailController get to => Get.find();

  final ScaleDB scaleDB = new ScaleDB();

  RxList<CustomScale> customScales = RxList<CustomScale>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    int sheetId = Get.arguments["rowId"];
    loadSheet(sheetId);
    super.onInit();
  }

  void loadSheet(int sheetId) async {
    List<CustomScale> res = await scaleDB.getAllDataBySheetId(sheetId);
    print(res.isEmpty ? "원소 없음" : res.last.rowId.toString());
    customScales(res);
    isLoading(false);
  }
}
