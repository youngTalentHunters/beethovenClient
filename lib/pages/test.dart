import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("테스트"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              VerticalSpacing(of: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '클릭 시 device db에 값 저장',
                ),
              ),
              VerticalSpacing(of: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '클릭 시 device db에 값 저장',
                ),
              ),
            ],
          ),
        ));
  }
}
