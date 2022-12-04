import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/account/lock/check_lock_page.dart';
import 'package:monsters_front_end/pages/account/lock/lock_widget.dart';
import 'package:monsters_front_end/pages/settings/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingLockPage extends StatefulWidget {
  @override
  _SettingLockPageState createState() => _SettingLockPageState();
}

class _SettingLockPageState extends State<SettingLockPage> {
  MPinController mPinController = MPinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      appBar: secondAppBar("設定密碼鎖"),
      body: Stack(
        children: [
          //白底
          Center(
            child: Container(
              height: 600,
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //顯示框
                  MPinWidget(
                    pinLegth: 4,
                    controller: mPinController,
                    onCompleted: (mPin) {
                      print('You entered -> $mPin');
                      savePin(mPin);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckLockPage()));
                    },
                  ),
                  SizedBox(height: 32),
                  //數字鍵盤
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: List.generate(
                        9, (index) => buildMaterialButton(index + 1)),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          null;
                        },
                      ),
                      buildMaterialButton(0),
                      MaterialButton(
                        onPressed: () {
                          mPinController.delete();
                        },
                        textColor: BackgroundColorWarm,
                        child: Icon(Icons.backspace_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput('$input');
      },
      textColor: BackgroundColorWarm,
      child: Text(
        '$input',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

void savePin(String pin) async {
  //儲存account shared preferences (後用來判斷此裝置是否登入過)
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("pin", pin);
}
