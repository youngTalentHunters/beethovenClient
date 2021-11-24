import 'dart:convert';
import 'dart:typed_data';

import 'package:beethoven/commonWidget/vertical_spacing.dart';
import 'package:beethoven/config/sizeconfig.dart';
import 'package:beethoven/controller/home_controller.dart';
import 'package:beethoven/controller/record_controller.dart';
import 'package:beethoven/conversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../../../method.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  static final clientID = 0;

  @override
  _BodyState createState() => _BodyState();
}

class _Message {
  int whom; // 누군지
  String text; // text

  _Message(this.whom, this.text);
}

class _BodyState extends State<Body> {
  final _textController = TextEditingController();
  List<int> recordScales = [];
  // ** 블루투스 통신 관련 로직 시작
  BluetoothConnection connection;
  List<_Message> messages = List<_Message>();

  final TextEditingController textEditingController =
      new TextEditingController();

  final ScrollController listScrollController = new ScrollController();

  // 피아노 연결(이건 들어갈때 마다 하면 될 듯)
  bool get isConnected => connection != null && connection.isConnected;
  bool isConnecting = true;
  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    // 블루투스 연결.
    BluetoothConnection.toAddress(HomeController.to.device.address)
        .then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false; // 진행중
        isDisconnecting = false; // 연결안됨
      });

      connection.input.listen(_onDataReceived).onDone(() {
        if (isDisconnecting) {
          // 앱에서 연결 안됨
          print('Disconnecting locally!');
        } else {
          // 아두이노에서 연결 안됨
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
    super.dispose();
  }
  // ** 블루투스 통신 관련 로직 끝

  @override
  Widget build(BuildContext context) {
    final List<Row> messageList = messages.map((_message) {
      return Row(
        children: <Widget>[
          Container(
            child: Text(
                (text) {
                  return text == '/shrug' ? '¯\\_(ツ)_/¯' : text;
                }(_message.text.trim()),
                style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: 222.0,
            decoration: BoxDecoration(
                color: _message.whom == Body.clientID
                    ? Colors.blueAccent
                    : Colors.grey,
                borderRadius: BorderRadius.circular(7.0)),
          ),
        ],
        mainAxisAlignment: _message.whom == Body.clientID
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
      );
    }).toList();

    return SingleChildScrollView(
      child: SafeArea(
          child: Obx(
        () => Column(
          children: <Widget>[
            VerticalSpacing(),
            Text(valueToStringScaleKo(RecordController.to.currentScale.value),
                style: TextStyle(fontSize: getProportionateScreenWidth(50))),
            VerticalSpacing(),
            Image(
              width: getProportionateScreenWidth(400),
              height: getProportionateScreenHeight(200),
              image: AssetImage("assets/images/scale/" +
                  RecordController.to.currentScale.value.toString() +
                  ".png"),
              fit: BoxFit.fill,
            ),
            // 녹음
            VerticalSpacing(of: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      isConnected ? _sendMessage('0') : print("연결 안됨");
                    },
                    child: CircleAvatar(
                        radius: getProportionateScreenWidth(45),
                        backgroundImage: AssetImage('assets/images/rec.png')),
                  ),
                  GestureDetector(
                    onTap: () {
                      isConnected ? _sendMessage('1') : print("연결 안됨");
                    },
                    child: CircleAvatar(
                        radius: getProportionateScreenWidth(45),
                        backgroundImage: AssetImage('assets/images/stop.png')),
                  ),
                  GestureDetector(
                    onTap: () {
                      isConnected ? _sendMessage('2') : print("연결 안됨");
                    },
                    child: CircleAvatar(
                        radius: getProportionateScreenWidth(45),
                        backgroundImage: AssetImage('assets/images/play.png')),
                  ),
                ],
              ),
            ),
            VerticalSpacing(of: 40),
            Container(
              //textbutton의 크기는 컨테이너로 감싼 후 지정한다
              width: getProportionateScreenWidth(300),
              height: getProportionateScreenHeight(50),
              child: TextButton(
                onPressed: () {
                  showDialogGetX(
                    message1: "해당 파일을 저장하시겠습니까?",
                    textController: _textController,
                    onConfirmMethod: () {
                      print("저장하면서 뒤로가기");
                      RecordController.to
                          .insertSheet(_textController.text)
                          .then((value) => RecordController.to
                              .insertScale(recordScales, value));
                      // 악보 저장
                      // 음계 저장
                      Get.back();
                      toastMessage("저장되었습니다!");
                    },
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFFF2EA),
                    primary: Color(0xff565656), //버튼 안의 text색
                    shape: //테두리를 둥글게
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                    textStyle: TextStyle(
                        //버튼안의 텍스트 스타일 지정
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                        letterSpacing: getProportionateScreenWidth(2))),
                child: Text(
                  "저장하기",
                ),
              ),
            ),
            // ** phone -> arduino 전송 코드
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   width: double.infinity,
            //   child: FittedBox(
            //     child: Row(
            //       children: [
            //         FlatButton(
            //           onPressed: isConnected ? () => _sendMessage('1') : null,
            //           child: ClipOval(
            //               child: Image.asset('assets/images/mainpiano.jpeg')),
            //         ),
            //         FlatButton(
            //           onPressed: isConnected ? () => _sendMessage('0') : null,
            //           child: ClipOval(
            //               child: Image.asset('assets/images/mainpiano.jpeg')),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Flexible(
            //   child: ListView(
            //       padding: const EdgeInsets.all(12.0),
            //       controller: listScrollController,
            //       children: messageList),
            // ),
          ],
        ),
      )),
    );
  }

  // ** 메세지 받기
  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // dataString이 받는 값
    // 저장하고, 값 변경
    String dataString = String.fromCharCodes(buffer);
    int scale = int.parse(dataString);
    print(int.parse(dataString));
    // currentScale 한국어로 변경, device DB에 insert까지.
    RecordController.to.setCurrentScale(scale);
    recordScales.add(scale);

    print('currentScale변경, device DB에 insert');
    setState(() {
      messages.add(new _Message(1, dataString));
    });
  }

  // ** 메세지 보내기
  void _sendMessage(String text) async {
    text = text.trim();
    print(text);
    textEditingController.clear();

    if (text.length > 0) {
      try {
        print(utf8.encode(text + "\r\n"));
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;

        // setState(() {
        //   messages.add(_Message(Body.clientID, text));
        // });

        // Future.delayed(Duration(milliseconds: 333)).then((_) {
        //   listScrollController.animateTo(
        //       listScrollController.position.maxScrollExtent,
        //       duration: Duration(milliseconds: 333),
        //       curve: Curves.easeOut);
        // });
      } catch (e) {
        // setState(() {});
      }
    }
  }
}
