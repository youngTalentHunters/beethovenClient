import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class HomeController extends GetxService {
  static HomeController get to => Get.find();

  BluetoothDevice device;
}
