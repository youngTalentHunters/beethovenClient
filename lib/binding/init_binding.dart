import 'package:beethoven/controller/home_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
