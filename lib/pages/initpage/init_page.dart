import 'package:beethoven/connection.dart';
import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/pages/homepage/home_page.dart';
import 'package:beethoven/pages/recordpage/record_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

// ** init -> record로 이동
// init하여 블루투스 연결 다음 record로 이동하도록
class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FlutterBluetoothSerial.instance.requestEnable(),
      builder: (context, future) {
        if (future.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              child: Center(
                child: Icon(
                  Icons.bluetooth_disabled,
                  size: 200.0,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        } else if (future.connectionState == ConnectionState.done) {
          return bluetoothListPage(context);
        } else {
          return bluetoothListPage(context);
        }
      },
    );
  }

  SafeArea bluetoothListPage(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('블루투스 연결페이지'),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (device1) {
          HomeController.to.device = device1; // device 설정 (전역변수)
          // Get.offNamed("/");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RecordPage();
              },
            ),
          );
        },
      ),
    ));
  }
}
