import 'package:beethoven/pages/homepage/home_page.dart';
import 'package:beethoven/pages/initpage/init_page.dart';
import 'package:beethoven/pages/recordpage/record_page.dart';
import 'package:beethoven/pages/scaleDetailPage/scale_detail_page.dart';
import 'package:beethoven/pages/scalePracticePage/scale_practice_page.dart';
import 'package:beethoven/pages/sheetDetailPage/sheet_detail_page.dart';
import 'package:beethoven/pages/sheetPracticePage/sheet_practice_page.dart';
import 'package:beethoven/pages/test.dart';
import 'package:get/get.dart';

final getPages = [
  GetPage(name: "/", page: () => HomePage()),
  GetPage(name: "/ScalePracticePage", page: () => ScalePracticePage()),
  GetPage(name: "/ScaleDetailPage", page: () => ScaleDetailPage()),
  GetPage(name: "/SheetPracticePage", page: () => SheetPracticePage()),
  GetPage(name: "/SheetDetailPage", page: () => SheetDetailPage()),
  GetPage(name: "/RecordPage", page: () => RecordPage()),
  GetPage(name: "/InitPage", page: () => InitPage()),
  GetPage(name: "/TestPage", page: () => TestPage()),
];
