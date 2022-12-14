import 'dart:convert';
import 'dart:developer' as dv;
import 'dart:math';

import 'package:adobe_xd/page_link.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_auth/email_auth.dart';
import 'package:http/http.dart' as http;
import 'package:monsters_front_end/pages/account/forgetPassword/reset_password.dart';
import 'package:monsters_front_end/pages/account/login_selfacount.dart';
import 'package:monsters_front_end/pages/settings/style.dart';

class Forget_password_Auth extends StatefulWidget {
  @override
  _Forget_password_AuthState createState() => _Forget_password_AuthState();
}

class _Forget_password_AuthState extends State<Forget_password_Auth> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    VerifyCode = 0;
  }

  void verifyCode(String input) {
    var inputCode = int.parse(input);
    if (inputCode == VerifyCode) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證成功",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Reset_Password(_mailController.text)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證失敗",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    }
  }

  Future sendVerifyEmail({
    required String userEmail,
    required int code,
  }) async {
    print("sending VerifyEmail");
    String? email = userEmail; //useremail
    const serviceId = "service_v0eahku";
    const templateId = "template_989nvlq";
    const userId = "x0TtUpsa7W7aHFIbl";
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'accessToken': "9OoipUoZgha107DzjjE3w",
          'template_params': {
            'user_email': email,
            'verify_code': code,
          }
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "驗證碼傳送成功",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "驗證碼傳送失敗",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffffed4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Stack(
                      children: [
                        //上一頁
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                              Container(
                            padding: const EdgeInsets.only(
                              left: 5,
                              top: 10,
                            ),
                            child: PageLink(
                              links: [
                                PageLinkInfo(
                                  transition: LinkTransition.Fade,
                                  ease: Curves.easeOut,
                                  duration: 0.3,
                                  pageBuilder: () => Login_selfacount(),
                                ),
                              ],
                              child: SvgPicture.string(
                                _svg_ryq30,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        //標題
                        const Center(
                          child: Text(
                            '忘記密碼',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 40,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50.0),
                  //信箱
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    autofocus: false,
                    controller: _mailController,
                    decoration: const InputDecoration(
                      labelText: "信箱",
                      hintText: '請輸入信箱',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        ///設定邊框四個角的弧度
                        borderRadius: BorderRadius.all(Radius.circular(90)),

                        ///用來配置邊框的樣式
                        borderSide: BorderSide(
                          ///設定邊框的顏色
                          color: Color.fromRGBO(160, 82, 45, 1),
                          width: 2.0,
                        ),
                      ),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? '請輸入正確的信箱格式'
                            : null,
                  ),
                  const SizedBox(height: 10.0),
                  //傳送認證碼
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          VerifyCode = Random().nextInt(899999) + 100000;
                          sendVerifyEmail(
                              userEmail: _mailController.text,
                              code: VerifyCode);
                        },
                        child: const Text(
                          '傳送認證碼',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: Color.fromRGBO(160, 82, 45, 1),
                          ),
                        )),
                  ),
                  const SizedBox(height: 10.0),
                  //認證碼
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _otpController,
                    decoration: const InputDecoration(
                      labelText: "認證碼",
                      hintText: '請輸入認證碼',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        ///設定邊框四個角的弧度
                        borderRadius: BorderRadius.all(Radius.circular(90)),

                        ///用來配置邊框的樣式
                        borderSide: BorderSide(
                          ///設定邊框的顏色
                          color: Color.fromRGBO(160, 82, 45, 1),
                          width: 2.0,
                        ),
                      ),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length == 6) {
                        return null;
                      } else if (value.isNotEmpty && value.length != 6) {
                        return '認證碼為6數';
                      } else {
                        return '認證碼不得空白';
                      }
                    },
                  ),
                  const SizedBox(height: 50.0),
                  //認證
                  SizedBox(
                    width: 200.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Color.fromRGBO(160, 82, 45, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      child: const Text(
                        '認證',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        softWrap: false,
                      ),
                      onPressed: () {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          verifyCode(_otpController.text);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int VerifyCode = 1;
const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
