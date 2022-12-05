import 'dart:developer';

import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/settings/monsters_information.dart';
import 'package:monsters_front_end/pages/manual/manual.dart';
import 'package:monsters_front_end/pages/settings/style.dart';

class Monster_detail extends StatefulWidget {
  int index;
  Monster_detail(this.index);

  @override
  _Monster_detailState createState() => _Monster_detailState(index);
}

class _Monster_detailState extends State<Monster_detail> {
  int index;
  _Monster_detailState(this.index);
  
  AssetImage _button1 = AssetImage('assets/image/skin_1_no.png');
  AssetImage _button2 = AssetImage('assets/image/skin_2_no.png');
  AssetImage _button3 = AssetImage('assets/image/skin_3_no.png');

  List ownSkin = [0, 1, 2, 3];

  int _selectedSkin = 0;
  void changeButton() {
    if (ownSkin.contains(1)) {
      _button1 = AssetImage('assets/image/skin_1_yes.png');
      if (_selectedSkin == 1) {
        _button1 = AssetImage('assets/image/skin_1_wear.png');
      }
    }
    if (ownSkin.contains(2)) {
      _button2 = AssetImage('assets/image/skin_2_yes.png');
      if (_selectedSkin == 2) {
        _button2 = AssetImage('assets/image/skin_2_wear.png');
      }
    }
    if (ownSkin.contains(3)) {
      _button3 = AssetImage('assets/image/skin_3_yes.png');
      if (_selectedSkin == 3) {
        _button3 = AssetImage('assets/image/skin_3_wear.png');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String monsterName = monsterNamesList[index];
    String monsterName_CH = monsterNamesList_CH[index];
    changeButton();
    

    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      appBar: secondAppBar("圖鑑"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //monster圖框
          Expanded(
            flex: 55,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(width: 2.65, color: const Color(0xffa0522d)),
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage(getMonsterImage(monsterName)),monster_Baku_item1
                    image: getMonsterSkin(index, _selectedSkin),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          //monster名稱
          Expanded(
            flex: 15,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2.5,
                            color: BackgroundColorWarm,
                          ),
                        ),
                      ),
                      child: Text(
                        monsterName_CH,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: Color(0xffa0522d),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //造型選項
          Expanded(
              flex: 30,
              child: Wrap(
                spacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (ownSkin.contains(1)) {
                        if (_selectedSkin == 1) {
                          _selectedSkin = 0;
                        } else {
                          _selectedSkin = 1;
                        }
                        setState(() {});
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: BackgroundColorWarm,
                      radius: 45.0,
                      child: CircleAvatar(
                        backgroundImage: _button1,
                        radius: 42.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (ownSkin.contains(2)) {
                        if (_selectedSkin == 2) {
                          _selectedSkin = 0;
                        } else {
                          _selectedSkin = 2;
                        }
                        setState(() {});
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: BackgroundColorWarm,
                      radius: 45.0,
                      child: CircleAvatar(
                        backgroundImage: _button2,
                        radius: 42.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (ownSkin.contains(3)) {
                        if (_selectedSkin == 3) {
                          _selectedSkin = 0;
                        } else {
                          _selectedSkin = 3;
                        }
                        setState(() {});
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: BackgroundColorWarm,
                      radius: 45.0,
                      child: CircleAvatar(
                        backgroundImage: _button3,
                        radius: 42.0,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
