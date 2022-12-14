// ignore_for_file: file_names, no_logic_in_create_state, must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/memberModel.dart';
import 'package:monsters_front_end/model/monsterModel.dart' as ms;
import 'package:monsters_front_end/pages/settings/monsters_information.dart';
import 'package:monsters_front_end/pages/drawer/edit_personalInfo.dart';
import 'package:monsters_front_end/pages/settings/style.dart';
import 'package:monsters_front_end/repository/memberRepo.dart';

import '../../repository/monsterRepo.dart';

class Drawer_personalInfo extends StatefulWidget {
  Drawer_personalInfo({
    Key? key,
  }) : super(key: key);
  @override
  _Drawer_personalInfoState createState() => _Drawer_personalInfoState();
}

class _Drawer_personalInfoState extends State<Drawer_personalInfo> {
  final MemberRepository memberRepository = MemberRepository();
  final MonsterRepository monsterRepository = MonsterRepository();
  late Future _future;
  late List ownList;

  //初始化
  @override
  void initState() {
    _future = getPersonalInfo();
    super.initState();
  }

  //關閉
  @override
  void dispose() {
    super.dispose();
  }

  Future<Map> getPersonalInfo() async {
    Map personalInfoResult = {};
    // print("doing...getPersonalInfo()");
    Future<Data> personalInfo = memberRepository
        .searchPersonalInfoByAccount()
        .then((value) => Data.fromJson(value!));

    await personalInfo.then(
      (value) async {
        personalInfoResult["nickName"] = value.data.first.nickName;
        personalInfoResult["birthday"] = value.data.first.birthday;
        personalInfoResult["mail"] = value.data.first.mail;
        personalInfoResult["account"] = value.data.first.account;
        personalInfoResult["photo"] = value.data.first.photo;
        // personalInfoResult["lock"] = value.data.first.lock;
        personalInfoResult["dailyTest"] = value.data.first.dailyTest;

        Future<ms.Data> monsters = monsterRepository
            .searchMonsterByAccount()
            .then((value) => ms.Data.fromJson(value!));
        await monsters.then(
          (value) {
            String temp = jsonDecode(value.data.first.monsterGroup!).toString();
            temp = temp.substring(1, temp.length - 1);
            List<String> monsterResult = temp.split(",");
            final List<int> monsterList =
                monsterResult.map((e) => int.parse(e)).toList();
            personalInfoResult.putIfAbsent("ownList", () => monsterList);
          },
        );
      },
    );

    return personalInfoResult;
  }

  @override
  Widget build(BuildContext context) {
    _future = getPersonalInfo();
    
    sleep(Duration(microseconds: 500));

    setState(() {});
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: secondAppBar("個人資料"),
        body: FutureBuilder<dynamic>(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return const Center(
                    child: Text(
                  "Loading...",
                  style: TextStyle(fontSize: 30),
                ));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //頭貼
                  Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 250,
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 10),
                              child: Container(
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3, color: const Color(0xffa0522d)),
                                ),
                                child: CircleAvatar(
                                  minRadius: 40,
                                  backgroundImage: AssetImage(
                                      getMonsterAvatarPath(monsterNamesList[
                                          snapshot.data["photo"]])),
                                ),
                              ),
                            ),
                          ),
                          Center(
                              child: GestureDetector(
                            onTap: () {
                              changeAvatar(context, snapshot.data["ownList"])
                                  .then((value) => setState(() {}));
                            },
                            child: Container(
                                width: 250,
                                margin: const EdgeInsets.only(
                                    bottom: 25, right: 20),
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image(
                                    width: 35,
                                    height: 35,
                                    image: AssetImage(
                                        'assets/image/personalInfo_edit.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                )),
                          )),
                        ],
                      )),
                  //使用者資訊
                  Expanded(
                      flex: 4,
                      child: Center(
                          child: SingleChildScrollView(
                        primary: false,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 40,
                          children: [
                            {
                              'text': '暱稱',
                              'content': snapshot.data["nickName"],
                            },
                            {
                              'text': '生日',
                              'content': snapshot.data["birthday"],
                            },
                            {
                              'text': '信箱',
                              'content': snapshot.data["mail"],
                            }
                          ].map((itemData) {
                            final text = itemData['text']!;
                            final content = itemData['content'];
                            return Row(
                              children: [
                                // 標題:暱稱/生日/信箱
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        text,
                                        style: const TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 30,
                                          color: Color(0xffa0522d),
                                        ),
                                        softWrap: false,
                                      ),
                                    )),
                                // 內容:暱稱/生日/信箱
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          30, 15, 30, 0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 2.0,
                                              color: BackgroundColorWarm),
                                        ),
                                      ),
                                      child: Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            content,
                                            style: const TextStyle(
                                              fontFamily: 'Segoe UI',
                                              fontSize: 22,
                                              color: Color(0xff000000),
                                            ),
                                            softWrap: false,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            );
                          }).toList(),
                        ),
                      ))),
                  //留白和編輯按鈕
                  Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        color: BackgroundColorLight,
                        child: SizedBox(
                          child: GestureDetector(
                            child: Container(
                              width: 130,
                              height: 70,
                              margin:
                                  const EdgeInsets.only(bottom: 40, right: 40),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: BackgroundColorSoft,
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: const Text(
                                '編輯',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 30,
                                  color: BackgroundColorWarm,
                                ),
                                softWrap: false,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit_personalInfo(
                                          data: snapshot.data)));
                            },
                          ),
                        ),
                      )),
                ],
              );
            }));
  }

  Future<dynamic> changeAvatar(BuildContext context, List ownList) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AvatarWidget(ownList);
      },
    );
  }
}

class AvatarWidget extends StatefulWidget {
  List ownList;
  AvatarWidget(this.ownList, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AvatarWidget(ownList);
  }
}

class _AvatarWidget extends State<AvatarWidget> {
  String selected = "";
  List ownList;

  _AvatarWidget(this.ownList);
  @override
  Widget build(BuildContext context) {
    int itemCounter = ownList.length;
    // int itemCounter = monsterNamesList.length;
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GridView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    children: List.generate(
                      itemCounter,
                      ((index) => GestureDetector(
                            onTap: () {
                              selected = monsterNamesList[ownList[index]];
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: (selected ==
                                      monsterNamesList[ownList[index]])
                                  ? BoxDecoration(
                                      color: BackgroundColorLight,
                                      borderRadius: const BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xffa0522d)),
                                    )
                                  : null,
                              child: CircleAvatar(
                                minRadius: 10,
                                backgroundImage: AssetImage(
                                    // getMonsterAvatarPath(
                                    //     monsterNamesList[index])),
                                    getMonsterAvatarPath(
                                        monsterNamesList[ownList[index]])),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatarButton(false),
                    const Spacer(),
                    avatarButton(true),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  GestureDetector avatarButton(bool save) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 50,
        margin: save
            ? const EdgeInsets.only(right: 20)
            : const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
          color: Color(0xffa0522d),
          borderRadius: BorderRadius.all(Radius.elliptical(80, 80)),
        ),
        child: Center(
          child: Text(
            (save == false) ? "取消" : "確定",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      onTap: () async {
        if (save == false) {
          Navigator.pop(context);
        } else {
          choosenAvatar = selected;
          log("selected: " + selected);

          final MemberRepository memberRepository = MemberRepository();
          int modifyAvatar = monsterNamesList.indexOf(choosenAvatar);
          log("modifyAvatar :" + modifyAvatar.toString());

          Future<Data> personalInfo = memberRepository
              .searchPersonalInfoByAccount()
              .then((value) => Data.fromJson(value!));

          String _nickName = "";
          int _dailyTest = 0;

          await personalInfo.then((value) async {
            _nickName = value.data.first.nickName!;
            _dailyTest = value.data.first.dailyTest!;
            log("_dailyTest: " + _dailyTest.toString());
          }).then((value) {
            memberRepository.modifyPersonalInfo(
              Member(
                account: userAccount,
                photo: modifyAvatar,
                nickName: _nickName,
                dailyTest: _dailyTest,
              ),
            );
            Navigator.pop(context);
          }).then((value) {
            setState(() {});
          });
        }
      },
    );
  }
}

const String _svg_pjak95 =
    '<svg viewBox="167.0 404.0 168.0 1.0" ><path transform="translate(167.0, 404.0)" d="M 0 0 L 168 0" fill="none" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

String choosenAvatar = "";
const String _svg_s6wsvh =
    '<svg viewBox="144.8 189.1 122.4 125.9" ><path transform="translate(138.8, 183.06)" d="M 67.2003173828125 68.94334411621094 C 84.10691070556641 68.94334411621094 97.80047607421875 54.85977935791016 97.80047607421875 37.47167205810547 C 97.80047607421875 20.08357048034668 84.10691070556641 5.999998092651367 67.2003173828125 5.999998092651367 C 50.29373168945312 5.999998092651367 36.60015869140625 20.08357048034668 36.60015869140625 37.47167205810547 C 36.60015869140625 54.85977935791016 50.29373168945312 68.94334411621094 67.2003173828125 68.94334411621094 Z M 67.2003173828125 84.67918395996094 C 46.77471160888672 84.67918395996094 6 95.22219848632812 6 116.1508560180664 L 6 131.8866882324219 L 128.400634765625 131.8866882324219 L 128.400634765625 116.1508560180664 C 128.400634765625 95.22219848632812 87.62593078613281 84.67918395996094 67.2003173828125 84.67918395996094 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
