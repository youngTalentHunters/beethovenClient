import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/constant/scale_with_container.dart';
import 'package:beethoven/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../method.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("테스트"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // HomeController.to.insertScale();
                    HomeController.to.insertSheet();
                  },
                  child: Text(
                    '클릭 시 device db에 scale 값 저장',
                  ),
                ),
                VerticalSpacing(of: 30),
                ElevatedButton(
                  onPressed: () {
                    // HomeController.to.printScale();
                    HomeController.to.printSheet();
                  },
                  child: Text(
                    '클릭 시 scale 프린트',
                  ),
                ),
                VerticalSpacing(of: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '클릭 시 scale 삭제',
                  ),
                ),
                VerticalSpacing(of: 30),
                Container(
                  height: 60,
                  width: getProportionateScreenWidth(414),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image:
                            new AssetImage('assets/images/emptySheetStart.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    // start는 top padding 4
                    padding: EdgeInsets.only(left: 40, right: 10, top: 2),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 18, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note0.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note1.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note1.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note1.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 6, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note1.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12, right: 6.4),
                          child: Image.asset(
                            'assets/images/low_note1.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14, right: 6.4),
                          child: Image.asset(
                            'assets/images/high_note.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, right: 6.4),
                          child: Image.asset(
                            'assets/images/high_note.png',
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: getProportionateScreenWidth(414),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                            'assets/images/emptySheetMiddle.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    // middle은 top padding 4
                    padding: EdgeInsets.only(left: 20, right: 10, top: 4),
                    child: Row(
                      children: [solScale, faScale, solScale, doScale, reScale],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialogGetX(
                      message1: "해당 파일을 저장하시겠습니까?",
                      textController: _textController,
                      onConfirmMethod: () {
                        print("hi");
                      },
                    );
                  },
                  child: Text('녹음'),
                )
              ],
            ),
          ),
        ));
  }
}
