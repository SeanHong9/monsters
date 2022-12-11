import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/manual/manual.dart';
import 'package:monsters_front_end/pages/settings/monsters_information.dart';
import 'package:monsters_front_end/pages/settings/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DailyTest_correct extends StatefulWidget {
  String learn, web;
  DailyTest_correct(this.learn, this.web);
  @override
  _DailyTest_correctState createState() =>
      _DailyTest_correctState(this.learn, this.web);
}

class _DailyTest_correctState extends State<DailyTest_correct> {
  late Future _future;
  var learn, web;
  _DailyTest_correctState(this.learn, this.web);
  late int unlockProgress;

  @override
  void initState() {
    _future = getUserDailyTestProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dailyTestReward();
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      appBar: secondAppBar("每日測驗"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //留白
          Expanded(
            flex: 5,
            child: Container(),
          ),
          //恭喜答對框
          Expanded(
            flex: 25,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Center(
                    child: Text(
                      '恭喜答對！',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 50,
                        color: Color(0xffffbb00),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
              flex: 26,
              child: FutureBuilder<dynamic>(
                  future: _future,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                          child: Text(
                        "Loading...",
                        style: TextStyle(fontSize: 30),
                      ));
                    }
                    return Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            alignment: Alignment.topLeft,
                            child: unlockProgress < 7
                                ? Text(
                                    "每天只有第一次能挑戰獎勵進度，\n再成功${7 - unlockProgress}次就可以解鎖隱藏獎勵！\n目前解鎖進度 ：",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: BackgroundColorWarm),
                                  )
                                : const Center(
                                    child: Text(
                                      "解鎖怪獸造型！",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: BackgroundColorWarm),
                                    ),
                                  )), //進度條
                        Expanded(
                          flex: 10,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(20),
                            child: progressBars(),
                          ),
                        ),
                      ],
                    );
                  })),

          //講解
          Expanded(
            flex: 40,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(width: 2.5, color: Colors.grey),
              ),
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        learn,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          letterSpacing: -1,
                          color: BackgroundColorWarm,
                          fontSize: 22,
                        ),
                      ))),
            ),
          ),

          Expanded(
            flex: 10,
            child: GestureDetector(
                onTap: () {
                  launchUrlString(web);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    "前往閱讀文章！",
                    style: TextStyle(
                      color: BackgroundColorWarm,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Row progressBars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        singleProgress(1),
        singleProgress(2),
        singleProgress(3),
        singleProgress(4),
        singleProgress(5),
        singleProgress(6),
        singleProgress(7),
      ],
    );
  }

  Expanded singleProgress(int value) {
    String showValue = value.toString();
    Container littleguy = Container();
    // Color boxColor = Colors.white;
    Color boxColor = Colors.white;
    if (unlockProgress == value) {
      littleguy = Container(
        child: SvgPicture.string(
          _svg_mu7hm4,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      );
    }
    if (value <= unlockProgress) {
      boxColor = BackgroundColorSoft;
    }
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(flex: 5, child: littleguy),
          Expanded(
            flex: 5,
            child: Container(
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    showValue,
                    style: const TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 17,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  dailyTestReward() async {
    //進度到7，顯示獲得怪獸
    if (unlockProgress == 7) {
      //要較晚跳出才能pop，不然會出錯
      Future.delayed(Duration(microseconds: 200), () {
        popUp(context);
      });
    }
  }

  Future<bool> getUserDailyTestProgress() async {
    unlockProgress = 3;
    //上面這行unlockProgress用sharepref替代

    // unlockProgress=SharedPreferences...
    return true;
  }

  Future<dynamic> popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DailyPresentWidget();
      },
    );
  }
}

class DailyPresentWidget extends StatefulWidget {
  const DailyPresentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DailyPresentWidget();
  }
}

class _DailyPresentWidget extends State<DailyPresentWidget> {
  String present_name = getRandomMonsterName_CH();
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 220,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: BackgroundColorLight,
                  ),
                  child: Center(
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/present.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "恭喜你獲得一個造型！ \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: BackgroundColorWarm, fontSize: 20),
                ),
                Text(
                  "${present_name}",
                  style: TextStyle(
                      color: BackgroundColorWarm,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Manual())),
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: EdgeInsets.only(
                          left: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            "查看圖鑑",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: EdgeInsets.only(
                          right: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            "謝謝",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mu7hm4 =
    '<svg viewBox="45.9 378.0 30.4 38.2" ><path transform="matrix(0.997564, 0.069756, -0.069756, 0.997564, 44.27, 375.5)" d="M 22.71305847167969 8.975848197937012 C 24.62021446228027 8.975848197937012 26.18061637878418 7.455781936645508 26.18061637878418 5.597923755645752 C 26.18061637878418 3.740065813064575 24.62021446228027 2.220000505447388 22.71305847167969 2.220000505447388 C 20.8059024810791 2.220000505447388 19.2455005645752 3.740065813064575 19.2455005645752 5.597923755645752 C 19.2455005645752 7.455781936645508 20.8059024810791 8.975848197937012 22.71305847167969 8.975848197937012 Z M 16.47145462036133 32.45241546630859 L 18.20523262023926 25.0209846496582 L 21.84616851806641 28.39890670776367 L 21.84616851806641 38.53268051147461 L 25.3137264251709 38.53268051147461 L 25.3137264251709 25.8654670715332 L 21.67279243469238 22.4875431060791 L 22.71305847167969 17.42065811157227 C 24.96697235107422 19.9541015625 28.43453025817871 21.64306259155273 32.24884414672852 21.64306259155273 L 32.24884414672852 18.26513862609863 C 28.95466232299805 18.26513862609863 26.18061637878418 16.5761775970459 24.79359245300293 14.21162986755371 L 23.05981254577637 11.50929164886475 C 22.36630058288574 10.49591541290283 21.32603454589844 9.820329666137695 20.11239051818848 9.820329666137695 C 19.59225463867188 9.820329666137695 19.2455005645752 9.989225387573242 18.72536659240723 9.989225387573242 L 9.709713935852051 13.70494174957275 L 9.709713935852051 21.64306259155273 L 13.17727184295654 21.64306259155273 L 13.17727184295654 15.90059280395508 L 16.29807472229004 14.71831893920898 L 13.52402782440186 28.39891052246094 L 5.028511524200439 26.70994758605957 L 4.335000038146973 30.08787155151367 L 16.4714527130127 32.45241928100586 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
