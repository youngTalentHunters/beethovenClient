import 'package:beethoven/connection.dart';
import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('블루투스 연결페이지'),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (device1) {
          HomeController.to.device = device1;
          // BluetoothDevice server = device1;
          // Get.offNamed("/");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        },
      ),
    ));
  }
}
