import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/constant/scale_with_container.dart';
import 'package:beethoven/controller/mySheetDetail_controller.dart';
import 'package:beethoven/conversion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() => Column(
            children: [
              VerticalSpacing(),
              Text(this.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              VerticalSpacing(),
              // 16로 값 나눠서 진행.
              MySheetDetailController.to.isLoading.value
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          ((MySheetDetailController.to.customScales.length -
                                      1) ~/
                                  16) +
                              1,
                      itemBuilder: (BuildContext context, int index) {
                        print("인덱스" + index.toString());
                        // index가 0이면 start로
                        return Container(
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
                            padding:
                                EdgeInsets.only(left: 10, right: 5, top: 4),
                            child: Row(
                              children: List.generate(
                                  // length보다 작으면 본인, 크면 length로
                                  MySheetDetailController.to.customScales
                                      .sublist(
                                          index * 16,
                                          ((index + 1) * 16) <
                                                  MySheetDetailController
                                                      .to.customScales.length
                                              ? ((index + 1) * 16)
                                              : MySheetDetailController
                                                  .to.customScales.length)
                                      .length,
                                  (i) => stringToImage(MySheetDetailController
                                      .to.customScales[index * 16 + i].text)),
                            ),
                          ),
                        );
                      })
            ],
          )),
    );
  }
}
