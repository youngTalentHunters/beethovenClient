import 'package:beethoven/binding/init_binding.dart';
import 'package:beethoven/pages/homepage/home_page.dart';
import 'package:beethoven/pages/initpage/init_page.dart';
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
        primarySwatch: createMaterialColor(Color(0xFFFFB6C1)),
        unselectedWidgetColor: Colors.grey,
      ),
      initialBinding: InitBinding(),
      getPages: getPages,
      home: HomePage(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
