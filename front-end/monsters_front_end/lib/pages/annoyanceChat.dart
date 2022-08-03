// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'dart:developer';
import 'dart:io';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/history.dart';
import '../model/annoyanceModel.dart';
import '../repository/annoyanceRepo.dart';

class AnnoyanceChat extends StatefulWidget {
  @override
  _AnnoyanceChat createState() => _AnnoyanceChat();
}

class _AnnoyanceChat extends State<AnnoyanceChat> with WidgetsBindingObserver {
  final messageInsert = TextEditingController();
  int chatRound = 0;
  String username = "Sean";
  bool firstSpeaking = true;
  bool lastSpeaking = false;
  bool robotSpeakable = false;
  List<Map> messages = [];
  List<String> annoyTypeMembers = ["", "課業", "事業", "愛情", "友情", "親情", "其他"];
  List<String> emotionGradeMembers = ["", "1", "2", "3", "4", "5"];
  List<String> acceptDrawingMembers = ["", "是", "否"];
  int acceptShare = 0;
  String hintAnnoyType = "[請擇一輸入]\n課業 / 事業 / 愛情 \n友情 / 親情 / 其他";
  String hintEmotionGrade = "[請擇一輸入]\n1 / 2 / 3 / 4 / 5";
  String hintAccept = "[請擇一輸入]\n是 / 否";
  String hintAnnoyMethod =
      "請選擇以下幾種方式開始記錄：\n★以文字記錄煩惱\n★按麥克風開始錄音\n★按相簿從手機存取\n★按相機開始照相或錄影";
  String hintCannotRead = "員工手冊上沒有這個選項耶...麻煩你確認一下答案好嗎？";
  String secHintAnnoyType = "煩惱是關於什麼的呢？";
  String secHintEmotionGrade = "煩惱指數有多高呢？\n1分是最低的喔！";
  String secHintDrawingAcception = "要不要把你的心情畫下來呢？";
  String secHintSharingAcception = "想分享給別人看看嗎？";
  String predictAns_annoyType = "";
  String predictAns_emotionGrade = "";
  String predictAns_accept = "";
  File? _image;
  var userAnswers = [];
  //增
  File? _paint;

  Future getMediaByCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);

    this._image = imageTemporary;
    if (_image != null) {
      messages.insert(0, {"data": 2, "image": _image});
      response();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
    if (firstSpeaking == true) {
      response("first"); //intro
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 164, 78, 38), //修改颜色
        ),
        backgroundColor: Color.fromRGBO(255, 237, 151, 1),
        elevation: 2.0,
        title: Text("巴古",
            style: TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 164, 78, 38))),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 229),
        child: Column(
          children: <Widget>[
            //聊天室框
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    //只要回傳直是一個container裡面放照片就好
                    itemBuilder: (context, index) => chat(
                          messages[index]["message"].toString(),
                          messages[index]["data"],
                          /*
                          data type list
                          0 : robot message text 
                          1 : user message text
                          2 : user message image from Camera 
                          3 : user message image from Gallery
                          4 : user message video from Camera  
                          5 : user message video from Gallery
                          6 : user message voice from Recording 
                          增
                          7 : user message image from Draw_paint() 
                          */
                        ))),
            SizedBox(
              height: 10,
            ),
            //底部功能列
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 237, 151, 1)),
              alignment: Alignment.bottomCenter,
              height: 60,
              //margin: EdgeInsets.only(bottom: 30),

              child: lastSpeaking == false
                  ? ListTile(
                      //camera
                      leading: IconButton(
                        alignment: Alignment.centerLeft,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Color.fromARGB(255, 164, 78, 38),
                          size: 28,
                        ),
                        onPressed: () {
                          getMediaByCamera();
                          /*
                          idea

                          改成多媒體按鈕(迴紋針)
                          點選迴紋針後可選擇錄影、錄音、照相、相簿
                          在做對應的功能
                          多媒體
                          顯示在聊天室頂部
                          */
                        },
                      ),
                      //輸入框
                      title: Container(
                        height: 35,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: messageInsert,
                          decoration: InputDecoration(
                            hintText: "Enter a Message...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          onChanged: (value) {},
                        ),
                      ),
                      //傳送紐
                      trailing: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30.0,
                            color: Color.fromARGB(255, 164, 78, 38),
                          ),
                          onPressed: () {
                            if (messageInsert.text.isEmpty) {
                            } else {
                              setState(() {
                                robotSpeakable = true;
                                messages.insert(0,
                                    {"data": 1, "message": messageInsert.text});
                              });
                              response(messageInsert.text);

                              if (lastSpeaking == true) {
                                Container(
                                    color: Colors.black,
                                    height: 100.0,
                                    alignment: Alignment.bottomCenter);
                              }
                              messageInsert.clear();
                            }
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          }),
                    )
                  //前往歷史紀錄
                  : ListTile(
                      title: Container(
                        child: TextButton(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 229),
                                    width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Text(
                              "前往歷史紀錄",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                          onPressed: () {
                            annoyanceRepository.createAnnoyance(
                              Annoyance(
                                  id: 0,
                                  account: 'Lin',
                                  content: userAnswers[1],
                                  monsterId: 1,
                                  type: userAnswers[0],
                                  mood: userAnswers[2],
                                  index: userAnswers[3],
                                  time: '',
                                  solve: 0,
                                  share: acceptShare),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          },
                        ),
                      ),
                    ),
            ),
            Container(color: Color.fromRGBO(255, 237, 151, 1), height: 10),
          ],
        ),
      ),
    );
  }

  //聊天功能
  Widget chat(String message, int data) {
    Container userChatContainer = Container();
    if (data == 2) {
      //回傳一個container裡面放照片
      userChatContainer = Container(
          alignment: Alignment.centerRight,
          child: Image.file(_image!,
              width: 200, height: 200, filterQuality: FilterQuality.medium));
    }
    //增加7，回傳圖畫
    if (data == 7) {
      userChatContainer = Container(
          alignment: Alignment.centerRight,
          child: Image.file(_paint!,
              width: 200, height: 200, filterQuality: FilterQuality.medium));
    } else {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment:
              data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            data == 0
                //巴古頭貼
                ? Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/image/Baku.png'),
                    ),
                  )
                : Container(),
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: data == 0
                      ? Colors.white
                      : Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            message,
                            style: TextStyle(
                                color: data == 0
                                    ? Color.fromRGBO(160, 82, 45, 1)
                                    : Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    return userChatContainer;
  }

  //怪獸訊息(請選擇)
  void hint() {
    if (chatRound == 0) {
      reply(hintAnnoyType);
    } else if (chatRound == 1) {
      reply(hintAnnoyMethod);
    } else if (chatRound == 2) {
      reply(hintAccept);
    } else if (chatRound == 3) {
      reply(hintEmotionGrade);
    } else if (chatRound == 4) {
      reply(hintAccept);
    } else {
      reply("還想新增更多煩惱嗎，再找下一位同伴來幫忙吧！");
    }
  }

  //怪獸訊息(聊天式)
  void cannotRead() {
    chatRound--;
    reply(hintCannotRead);
    if (chatRound == 0) {
      reply(secHintAnnoyType);
    }
    if (chatRound == 2) {
      reply(secHintDrawingAcception);
    }
    if (chatRound == 3) {
      reply(secHintEmotionGrade);
    }
    if (chatRound == 4) {
      reply(secHintSharingAcception);
    }
  }

  //確認是否符合選擇格式
  void response([String? text]) {
    setState(() {
      if (chatRound < 7) {
        if (robotSpeakable == true) {
          if (chatRound == 1) {
            if (annoyTypeMembers.contains(text)) {
              userAnswers.add(annoyTypeMembers.indexOf(text!));
              reply("關於" + text + "的煩惱嗎？跟我說發生什麼事了吧！");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 2) {
            userAnswers.add(text);
            reply("真是辛苦你了，想做一幅畫表達你的感受嗎？");
          }
          if (chatRound == 3) {
            if (acceptDrawingMembers.contains(text)) {
              if (text == "是") {
                //改
                _navigateAndDisplayPaint(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Draw_mood()));
              }
              userAnswers.add(text!);
              reply("給煩惱程度打一個分數～\n5分是最煩惱的喔！");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 4) {
            if (emotionGradeMembers.contains(text)) {
              userAnswers.add(emotionGradeMembers.indexOf(text!));
              reply("想不想把這件事分享給別人呢？");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 5) {
            if (acceptShare == 0 || acceptShare == 1) {
              if (text == "是") {
                userAnswers.add(emotionGradeMembers.indexOf("1"));
                acceptShare = 1;
              } else if (text == "否") {
                acceptShare = 0;
                userAnswers.add(emotionGradeMembers.indexOf("0"));
              }
              lastSpeaking = true;

              reply("解決煩惱請馬上跟我說！我已經迫不及待想吃飯了！");
            } else {
              cannotRead();
            }
          }
        }

        //進入自動訊息
        if (firstSpeaking == true) {
          firstSpeaking = false;
          int hourNow = DateTime.now().hour.toInt();
          if (hourNow < 5) {
            reply("凌晨睡不好嗎？\n有甚麼煩惱都可以跟我說"); //0~5點
          } else if (hourNow < 12) {
            reply("早上好啊！\n發生甚麼事情都可以跟我說"); //5~12點
          } else if (hourNow < 14) {
            reply("中午好啊！\n午餐吃了嗎？發生任何事都可以找我聊聊"); //12~14點
          } else {
            reply("下午好，今天過得如何呀！正在煩惱什麼事情嗎?"); //14~24點
          }
          reply("什麼樣子的煩惱呢？");
        }

        hint();
        chatRound++;
      }
    });
  }

  void reply(String text) {
    messages.insert(0, {"data": 0, "message": text});
  }

  //增
  Future<void> _navigateAndDisplayPaint(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Draw_mood()),
    );
    if (result == null) return;
    if (result != null) {
      this._paint = result;
      messages.insert(0, {"data": 7, "image": _paint});
      response();
    }
    setState(() {});
  }
}
