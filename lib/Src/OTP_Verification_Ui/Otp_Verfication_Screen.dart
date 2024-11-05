import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/SuccessModel.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/Src/Location_Ui/Location_screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Otp_Verification_Screen extends ConsumerStatefulWidget {
  String mobileNo = "";
  Otp_Verification_Screen({super.key, required this.mobileNo});

  @override
  ConsumerState<Otp_Verification_Screen> createState() =>
      _Otp_Verification_ScreenState();
}

class _Otp_Verification_ScreenState
    extends ConsumerState<Otp_Verification_Screen> {
  int _timeLeft = 30; // Timer duration in seconds
  bool _isTimerActive = false;
  String device_id = "";

  final _formKey = GlobalKey<FormState>();
  // Timer callback function
  void _tick() {
    if (_timeLeft == 0) {
      setState(() {
        _isTimerActive = false;
      });
    } else {
      setState(() {
        _timeLeft--;
      });
    }
  }

  // Start the timer
  void _startTimer() {
    setState(() {
      _timeLeft = 30;
      _isTimerActive = true;
    });
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_isTimerActive) {
        _tick();
      } else {
        timer.cancel();
      }
    });
  }

  final TextEditingController _OTP1 = TextEditingController();
  final TextEditingController _OTP2 = TextEditingController();
  final TextEditingController _OTP3 = TextEditingController();
  final TextEditingController _OTP4 = TextEditingController();
  final TextEditingController _OTP5 = TextEditingController();
  final TextEditingController _OTP6 = TextEditingController();
  Widget _textFieldOTP({bool? first, bool? last, controllers}) {
    return Container(
      height: 45,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white1,
      ),

      // margin: EdgeInsets.only(left: 10),
      child: TextField(
        controller: controllers,
        autofocus: true,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            setState(() {
              FocusScope.of(context).previousFocus();
            });
          }
        },
        showCursor: true,
        textAlign: TextAlign.center,
        // style: OtpTextfield_Style,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          fillColor: white1,
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: white1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: white1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  getDeviceID() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
        device_id =
            iosDeviceInfo.identifierForVendor ?? ""; // e.g. "Moto G (4)"
      });
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        device_id = androidDeviceInfo.id; // e.g. "Moto G (4)"
      });
    }
    print('Running on ${device_id}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: '',
        actions: null,
        isNav: true,
        isGreen: false,
      ),
      backgroundColor: white1,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 280,
                        width: 350,
                        child: ImgPathSvg('logoback.svg')),
                    Positioned(
                      top: 0,
                      left: 90,
                      right: 60,
                      child: SizedBox(
                          height: 300,
                          width: 300,
                          child: ImgPathPng('logo.png')),
                    ),
                  ],
                ),
                Text("Freshly Produced ", style: appLoginT),
                Text(
                  "ORGANIC",
                  style: appLoginT1,
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.sizeOf(context).height / 2.5,
                  decoration: const BoxDecoration(
                      color: green1,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 5),
                          child: Title_Style(Title: 'Enter OTP'),
                        ),
                        Container(
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerLeft,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP1),
                              const SizedBox(
                                width: 10,
                              ),
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP2),
                              const SizedBox(
                                width: 10,
                              ),
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP3),
                              const SizedBox(
                                width: 10,
                              ),
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP4),
                              const SizedBox(
                                width: 10,
                              ),
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP5),
                              const SizedBox(
                                width: 10,
                              ),
                              _textFieldOTP(
                                  first: true, last: true, controllers: _OTP6),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: _isTimerActive
                                  ? null
                                  : () {
                                      _startTimer();
                                    },
                              child: Container(
                                alignment: Alignment.topRight,
                                child:
                                    Text(_isTimerActive ? "00:$_timeLeft" : "",
                                        // style: changeT,
                                        style: const TextStyle(color: white1)),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  _startTimer();
                                },
                                child: Text(
                                  _isTimerActive ? 'Resend OTP' : 'Resend OTP',
                                  style: TextStyle(
                                      color: _isTimerActive ? white1 : white1,
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 50),
                          child:
                              CommonElevatedButton(context, "Verify", () async {
                            if (_formKey.currentState!.validate()) {
                              LoadingOverlay.show(context);

                              final apiService =
                                  ApiService(ref.read(dioProvider));

                              Map<String, dynamic> data = {
                                "PhoneNumber": widget.mobileNo,
                                "OTP": _OTP1.text +
                                    _OTP2.text +
                                    _OTP3.text +
                                    _OTP4.text +
                                    _OTP5.text +
                                    _OTP6.text,
                                "IMEI": device_id
                              };
                              final postResponse =
                                  await apiService.sendOTP<SuccessModel>(
                                      ConstantApi.VerifyOTPtUrl, data);
                              await LoadingOverlay.hide();

                              if (postResponse.status == "True") {
                                SingleTon().justLogged = true;

                                getUserInfo();
                              } else {
                                ShowToastMessage(postResponse.message ?? "");
                              }
                            }
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getUserInfo() async {
    LoadingOverlay.show(context);

    final apiService = ApiService(ref.read(dioProvider));

    Map<String, dynamic> data = {
      "mobile_no": widget.mobileNo,
      "imei_no": device_id
    };
    final postResponse =
        await apiService.sendOTP<LoginModel>(ConstantApi.loginUrl, data);
    await LoadingOverlay.hide();

    if (postResponse.status == "True") {
      ShowToastMessage(postResponse.message ?? "");
      accessToken(postResponse.tokenID ?? "");
      UserId(postResponse.data?[0].userId ?? "");

      if ((data['addressId'] ?? "") != "") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Bottom_Navigation_Bar(select: 0)),
            (Route<dynamic> route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Location_Screen(
                      isbackNavHide: true,
                    )),
            (Route<dynamic> route) => false);
      }

      String Boolvalue = "true";
      Routes(Boolvalue);
      print('ROUTES : ${Routes(Boolvalue)}');
    } else {
      ShowToastMessage(postResponse.message ?? "");
    }
  }
}
