import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_dairy extends StatelessWidget {
  XD_dairy({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdeb),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 52.0, middle: 0.5),
            Pin(size: 54.0, end: 13.0),
            child: SvgPicture.string(
              _svg_oh6n4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 88.0, end: 0.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffffed97),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 211.0, middle: 0.6716),
            Pin(size: 41.0, end: 22.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 15.0),
            Pin(size: 68.0, start: 102.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 15.0),
            Pin(size: 68.0, middle: 0.5662),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 223.0, middle: 0.5926),
            Pin(size: 60.0, start: 107.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.2),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_nhjq4,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
                Pinned.fromPins(
                  Pin(size: 149.0, end: 31.0),
                  Pin(size: 48.0, end: 0.0),
                  child: Text(
                    '寫下你的心情吧 ！\n',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.164, -0.188),
            child: SizedBox(
              width: 235.0,
              height: 93.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_i382sl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Pinned.fromPins(
                    Pin(size: 126.0, middle: 0.4954),
                    Pin(size: 24.0, start: 8.6),
                    child: Text(
                      '是否要畫心情？',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.57, 0.14),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '是',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.527, 0.14),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '否',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.175, 0.446),
            child: SizedBox(
              width: 235.0,
              height: 93.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_s7xcmg,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Pinned.fromPins(
                    Pin(size: 108.0, middle: 0.5157),
                    Pin(size: 24.0, start: 7.7),
                    child: Text(
                      '是否要分享？',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.559, 0.134),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '是',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.527, 0.134),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '否',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 288.0, end: 36.0),
            Pin(size: 93.4, middle: 0.5678),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_f7pmtp,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Pinned.fromPins(
                  Pin(start: 40.0, end: 32.0),
                  Pin(size: 24.0, start: 8.6),
                  child: Text(
                    '為今天的心情打個分數吧！',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 17.0),
            Pin(size: 68.0, middle: 0.7127),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 17.0),
            Pin(size: 68.0, end: 108.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 232.0, end: 11.0),
            Pin(size: 82.8, middle: 0.2533),
            child: SvgPicture.string(
              _svg_ujf864,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 45.4, start: 17.0),
            Pin(size: 38.8, end: 23.0),
            child:
                // Adobe XD layer: 'Icon awesome-camera' (shape)
                SvgPicture.string(
              _svg_yi2ac3,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 33.1, middle: 0.2355),
            Pin(size: 45.1, end: 19.8),
            child:
                // Adobe XD layer: 'Icon awesome-microp…' (shape)
                SvgPicture.string(
              _svg_aaxyv9,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 88.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffffed97),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 45.6, start: 14.4),
            Pin(size: 41.1, start: 23.4),
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                SvgPicture.string(
              _svg_c4osv9,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 31.5, end: 12.3),
            Pin(size: 27.0, end: 28.9),
            child:
                // Adobe XD layer: 'Icon material-send' (shape)
                SvgPicture.string(
              _svg_qz6nz,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 235.0, middle: 0.5847),
            Pin(size: 93.4, end: 92.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_s7xcmg,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Pinned.fromPins(
                  Pin(size: 126.0, middle: 0.5),
                  Pin(size: 24.0, start: 7.7),
                  child: Text(
                    '是否匿名分享？',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.559, 0.134),
                  child: SizedBox(
                    width: 49.0,
                    height: 24.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                            Pinned.fromPins(
                              Pin(size: 18.0, middle: 0.5),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                '是',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.527, 0.134),
                  child: SizedBox(
                    width: 49.0,
                    height: 24.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                            Pinned.fromPins(
                              Pin(size: 18.0, middle: 0.5),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                '否',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.271, 0.142),
            child: SizedBox(
              width: 231.0,
              height: 37.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 37.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'worst' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image2/happy.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.0, middle: 0.2577),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'worst' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image2/fine.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.0, middle: 0.5052),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'worst' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image2/not bad.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.0, middle: 0.7526),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'worst' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image2/not good.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'worst' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image2/bad bad.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_oh6n4 =
    '<svg viewBox="180.0 711.0 52.0 54.0" ><path transform="translate(180.0, 710.88)" d="M 25.54673194885254 54.12040328979492 C 21.82439994812012 54.05290222167969 18.86386680603027 50.56230926513672 18.9357967376709 46.32462692260742 C 18.94706535339355 45.6369514465332 19.03806304931641 44.97177505493164 19.19753074645996 44.33990478515625 L 18.9687328338623 44.33540344238281 L 19.1403923034668 34.1219482421875 L 7.389199733734131 34.1219482421875 L 7.115333080291748 34.1219482421875 L 7.115333080291748 34.11744689941406 C 3.16159987449646 33.98153305053711 0 30.9013843536377 0 27.12095642089844 C 0 23.34142684936523 3.16159987449646 20.26128196716309 7.115333080291748 20.12536430358887 L 7.115333080291748 20.11996459960938 L 19.37573432922363 20.11996459960938 L 19.58493232727051 7.673354625701904 L 19.59013175964355 7.388922691345215 L 19.5944652557373 7.388922691345215 C 19.79466438293457 3.285358190536499 22.81499862670898 0.05579237267374992 26.45413398742676 0.1223999261856079 C 30.09239959716797 0.1881073564291 33.00266265869141 3.524784803390503 33.06505966186523 7.632848262786865 L 33.06939315795898 7.633748531341553 L 32.85968780517578 20.11996459960938 L 42.69546508789062 20.11996459960938 L 42.69546508789062 20.35758972167969 C 43.30646133422852 20.2027759552002 43.94866180419922 20.11996459960938 44.61079788208008 20.11996459960938 C 48.69192886352539 20.11996459960938 51.99999618530273 23.25501823425293 51.99999618530273 27.12095642089844 C 51.99999618530273 30.98779296875 48.69192886352539 34.1219482421875 44.61079788208008 34.1219482421875 C 43.94866180419922 34.1219482421875 43.30646133422852 34.04004287719727 42.69546508789062 33.88432312011719 L 42.69546508789062 34.1219482421875 L 32.62451553344727 34.1219482421875 L 32.4488639831543 44.58023834228516 L 32.22006607055664 44.57573318481445 C 32.35873413085938 45.2130012512207 32.42719650268555 45.88088226318359 32.41506195068359 46.5694580078125 C 32.34469604492188 50.76549530029297 29.32918548583984 54.12139129638672 25.6562557220459 54.12140274047852 C 25.61980628967285 54.12140274047852 25.58330917358398 54.12107849121094 25.54673194885254 54.12040328979492 Z" fill="#ffed97" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nhjq4 =
    '<svg viewBox="155.0 112.0 223.0 54.8" ><path transform="translate(155.0, 980.0)" d="M 20.36400604248047 -821.189697265625 L 19.99979972839355 -821.189697265625 C 8.954100608825684 -821.189697265625 0 -830.1447143554688 0 -841.1904296875 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 203.0004119873047 -867.9996337890625 C 214.0461120605469 -867.9996337890625 223.0001983642578 -859.0455322265625 223.0001983642578 -847.9998168945312 L 223.0001983642578 -841.1904296875 C 223.0001983642578 -830.1447143554688 214.0461120605469 -821.189697265625 203.0004119873047 -821.189697265625 L 34.30353546142578 -821.189697265625 L 20.23830032348633 -813.1527099609375 L 20.36400604248047 -821.189697265625 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i382sl =
    '<svg viewBox="106.0 289.6 235.0 93.4" ><path transform="translate(106.0, 1157.59)" d="M 21.45980262756348 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 215.0001068115234 -867.9996337890625 C 226.0458068847656 -867.9996337890625 234.9999084472656 -859.0455322265625 234.9999084472656 -847.9998168945312 L 234.9999084472656 -808.2764892578125 C 234.9999084472656 -797.2308349609375 226.0458068847656 -788.2767333984375 215.0001068115234 -788.2767333984375 L 36.14965438842773 -788.2767333984375 L 21.32730102539062 -774.588623046875 L 21.45980262756348 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s7xcmg =
    '<svg viewBox="112.0 593.8 235.0 93.4" ><path transform="translate(112.0, 1461.78)" d="M 21.45980262756348 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 215.0001068115234 -867.9996337890625 C 226.0458068847656 -867.9996337890625 234.9999084472656 -859.0455322265625 234.9999084472656 -847.9998168945312 L 234.9999084472656 -808.2764892578125 C 234.9999084472656 -797.2308349609375 226.0458068847656 -788.2767333984375 215.0001068115234 -788.2767333984375 L 36.14965438842773 -788.2767333984375 L 21.32730102539062 -774.588623046875 L 21.45980262756348 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f7pmtp =
    '<svg viewBox="96.0 661.8 288.0 93.4" ><path transform="translate(96.0, 1529.83)" d="M 26.30019950866699 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 268.0002136230469 -867.9996337890625 C 279.0458984375 -867.9996337890625 288 -859.0455322265625 288 -847.9998168945312 L 288 -808.2764892578125 C 288 -797.2308349609375 279.0458984375 -788.2767333984375 268.0002136230469 -788.2767333984375 L 44.30284118652344 -788.2767333984375 L 26.1378002166748 -774.588623046875 L 26.30019950866699 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ujf864 =
    '<svg viewBox="169.0 176.1 232.0 82.8" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 401.0, 258.9)" d="M 19.99979972839355 82.8468017578125 C 8.954100608825684 82.8468017578125 0 73.8927001953125 0 62.84700012207031 L 0 32.13990020751953 C 0 21.09420013427734 8.954100608825684 12.14010047912598 19.99979972839355 12.14010047912598 L 21.18630218505859 12.14010047912598 L 21.05550003051758 0 L 35.68844985961914 12.14010047912598 L 212.0004119873047 12.14010047912598 C 223.0461120605469 12.14010047912598 232.0001983642578 21.09420013427734 232.0001983642578 32.13990020751953 L 232.0001983642578 62.84700012207031 C 232.0001983642578 73.8927001953125 223.0461120605469 82.8468017578125 212.0004119873047 82.8468017578125 L 19.99979972839355 82.8468017578125 Z" fill="#ffed97" stroke="none" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yi2ac3 =
    '<svg viewBox="17.0 716.3 45.4 38.8" ><path transform="translate(17.0, 714.0)" d="M 45.42932891845703 11.93749904632568 L 45.42932891845703 36.84821319580078 C 45.42932891845703 39.14034652709961 43.52165222167969 41 41.17033004760742 41 L 4.258999824523926 41 C 1.907676935195923 41 0 39.14034652709961 0 36.84821319580078 L 0 11.93749904632568 C 0 9.645367622375488 1.907676935195923 7.785713672637939 4.258999824523926 7.785713672637939 L 12.06716537475586 7.785713672637939 L 13.15853404998779 4.940011501312256 C 13.77963829040527 3.322544574737549 15.36788940429688 2.25 17.1424732208252 2.25 L 28.27798080444336 2.25 C 30.05256462097168 2.25 31.64081764221191 3.322544574737549 32.26192092895508 4.940011501312256 L 33.36216354370117 7.785713672637939 L 41.17033004760742 7.785713672637939 C 43.52165222167969 7.785713672637939 45.42932891845703 9.645367622375488 45.42932891845703 11.93749904632568 Z M 33.36216354370117 24.39285659790039 C 33.36216354370117 18.6668529510498 28.58853530883789 14.01339149475098 22.71466445922852 14.01339149475098 C 16.84079360961914 14.01339149475098 12.06716537475586 18.6668529510498 12.06716537475586 24.39285659790039 C 12.06716537475586 30.11886215209961 16.84079360961914 34.77231979370117 22.71466445922852 34.77231979370117 C 28.58853530883789 34.77231979370117 33.36216354370117 30.11886215209961 33.36216354370117 24.39285659790039 Z M 30.52283096313477 24.39285659790039 C 30.52283096313477 28.587890625 27.01802825927734 32.00446319580078 22.71466445922852 32.00446319580078 C 18.41130065917969 32.00446319580078 14.90649890899658 28.587890625 14.90649890899658 24.39285659790039 C 14.90649890899658 20.19782257080078 18.41130065917969 16.78125 22.71466445922852 16.78125 C 27.01802825927734 16.78125 30.52283096313477 20.19782257080078 30.52283096313477 24.39285659790039 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aaxyv9 =
    '<svg viewBox="89.2 713.1 33.1 45.1" ><path transform="translate(89.25, 713.06)" d="M 16.53855133056641 31.02226257324219 C 21.52078819274902 31.02226257324219 25.55957794189453 27.23437309265137 25.55957794189453 22.5616455078125 L 25.55957794189453 8.460617065429688 C 25.55957794189453 3.787888765335083 21.52078819274902 0 16.53855133056641 0 C 11.55631351470947 0 7.517523288726807 3.787888765335083 7.517523288726807 8.460617065429688 L 7.517523288726807 22.5616455078125 C 7.517523288726807 27.23437309265137 11.55631351470947 31.02226257324219 16.53855133056641 31.02226257324219 Z M 31.5735969543457 16.92123413085938 L 30.07009315490723 16.92123413085938 C 29.23940467834473 16.92123413085938 28.56658744812012 17.55225563049316 28.56658744812012 18.33133697509766 L 28.56658744812012 22.5616455078125 C 28.56658744812012 29.15387535095215 22.50652503967285 34.44352340698242 15.3366870880127 33.78782653808594 C 9.087745666503906 33.21585464477539 4.510513782501221 27.94735717773438 4.510513782501221 22.05929565429688 L 4.510513782501221 18.33133697509766 C 4.510513782501221 17.55225563049316 3.837695598602295 16.92123413085938 3.007009267807007 16.92123413085938 L 1.503504633903503 16.92123413085938 C 0.6728183627128601 16.92123413085938 0 17.55225563049316 0 18.33133697509766 L 0 21.87069511413574 C 0 29.77079582214355 6.011198997497559 36.81337738037109 14.28329372406006 37.88329315185547 L 14.28329372406006 40.89298248291016 L 9.021027565002441 40.89298248291016 C 8.190340995788574 40.89298248291016 7.517523288726807 41.52400207519531 7.517523288726807 42.30308532714844 L 7.517523288726807 43.71318817138672 C 7.517523288726807 44.49227142333984 8.190340995788574 45.123291015625 9.021027565002441 45.123291015625 L 24.05607414245605 45.123291015625 C 24.88676071166992 45.123291015625 25.55957794189453 44.49227142333984 25.55957794189453 43.71318817138672 L 25.55957794189453 42.30308532714844 C 25.55957794189453 41.52400207519531 24.88676071166992 40.89298248291016 24.05607414245605 40.89298248291016 L 18.79380798339844 40.89298248291016 L 18.79380798339844 37.91678619384766 C 26.84789276123047 36.8803596496582 33.07710266113281 30.39653015136719 33.07710266113281 22.5616455078125 L 33.07710266113281 18.33133697509766 C 33.07710266113281 17.55225563049316 32.4042854309082 16.92123413085938 31.5735969543457 16.92123413085938 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c4osv9 =
    '<svg viewBox="14.4 23.4 45.6 41.1" ><path transform="translate(8.76, 17.11)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#f4a460" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qz6nz =
    '<svg viewBox="368.3 722.1 31.5 27.0" ><path transform="translate(365.25, 717.63)" d="M 3.015000104904175 31.5 L 34.5 18 L 3.015000104904175 4.5 L 3 15 L 25.5 18 L 3 21 L 3.015000104904175 31.5 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
