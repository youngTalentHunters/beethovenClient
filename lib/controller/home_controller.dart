import 'package:beethoven/config/scaleDB.dart';
import 'package:beethoven/config/sheetDB.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class HomeController extends GetxService {
  static HomeController get to => Get.find();

  BluetoothDevice device;
  final SheetDB sheetDb = new SheetDB();
  final ScaleDB scaleDB = new ScaleDB();
}
