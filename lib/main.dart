import 'package:beethoven/binding/init_binding.dart';
import 'package:beethoven/pages/homepage/home_page.dart';
import 'package:beethoven/pages/initpage/init_page.dart';
import 'package:beethoven/pages/playpage/play_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import 'routes_getx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays(
    //     SystemUiOverlay.values); // 상단, 하단 status 존재
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 투명색
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'beethoven',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        unselectedWidgetColor: Colors.grey,
      ),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: getPages,
      home: FutureBuilder(
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
            return InitPage();
          } else {
            return InitPage();
          }
        },
      ),
      // home: PlayPage(),
    );
  }
}
