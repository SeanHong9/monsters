// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/destressWay_detail/destressWay_detail.dart';
import 'package:monsters_front_end/pages/destressWays_list/destressWays_list.dart';
import 'package:monsters_front_end/pages/history_annoyanceChat.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:monsters_front_end/pages/social.dart';
import 'package:monsters_front_end/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/destressWays_list/destressWays_list.dart';
import 'pages/style.dart';

void main() async {
  //開啟APP先判斷
  WidgetsFlutterBinding.ensureInitialized();
  checkLogin();
  runApp(Monsters());
}

class Monsters extends StatelessWidget with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        break;
      case AppLifecycleState.paused:
        log(state.toString());
        break;
      case AppLifecycleState.resumed:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        log(state.toString());
        break;
      case AppLifecycleState.detached:
        log(state.toString());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: '貘nsters',
      theme: _theme(),
      routes: {
        GitmeRebornRoutes.login: (context) => LoginPage(),
        GitmeRebornRoutes.home: (context) => MainPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case GitmeRebornRoutes.root:
            return MaterialPageRoute(builder: (context) => LoginPage());
          default:
            return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _theme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        titleTextStyle: AppBarTextStyle, backgroundColor: BackgroundColorWarm),
    textTheme: TextTheme(subtitle1: TitleTextStyle, bodyText1: Body1TextStyle),
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

void checkLogin() async {
  //check if user already login or credential already available or not
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? val = pref.getString("login");
  if (val != null) {
    //直接前往主畫面 !!失敗!!
    print("已登入過，帳號:" + val);
    MaterialPageRoute(builder: (context) => LoginPage());
  } else {
    print("已登出或第一次開啟");
  }
}
