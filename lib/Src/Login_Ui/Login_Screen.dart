import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Model/SuccessModel.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/Src/Location_Ui/Location_screen.dart';
import 'package:vilfresh/Src/OTP_Verification_Ui/Otp_Verfication_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Login_Screen extends ConsumerStatefulWidget {
  const Login_Screen({super.key});

  @override
  ConsumerState<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends ConsumerState<Login_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _MobileNumber = TextEditingController();

  bool? ischeckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white1,
        body: SingleChildScrollView(
          child: Form(key: _formKey, child: _MainBody()),
        ));
  }

  //MAIN BODY
  Widget _MainBody() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //LOGO
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 50),
              child: Container(
                  height: MediaQuery.sizeOf(context).height / 4.5,
                  child: ImgPathPng("loginlogo.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Container(height: 85, child: ImgPathPng('logoname.png')),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: green1,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    //ENTER MOBILE NUMBER
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Title_Style(Title: 'Enter your Phone Number'),
                    ),
                    textFormField(
                      hintText: 'Mobile Number',
                      keyboardtype: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      Controller: _MobileNumber,
                      validating: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a mobile number";
                        } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                          return "Please enter a valid 10-digit mobile number";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: ischeckbox,
                          activeColor: Colors
                              .green, // Change this to your desired color for the checked state

                          onChanged: (value) {
                            setState(() {
                              ischeckbox = value;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          side: BorderSide(
                            color: Colors
                                .white, // Change this to your desired border color
                            width: 2.0, // Set the width of the border
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'By Signing up you agree to our Privacy Policy and Terms& Conditions of use',
                            style: termsT,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    //BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: CommonElevatedButton(context, "Login", () async {
                        if (_formKey.currentState!.validate()) {
                          if (ischeckbox == true) {
                            getUserInfo();
                          } else {
                            ShowToastMessage(
                                "Please Accept the Terms and Condotions");
                          }
                        }
                      }),
                    ),

                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  //DASHBOARD
  Future<void> getUserInfo() async {
    LoadingOverlay.show(context);

    final apiService = ApiService(ref.read(dioProvider));

    Map<String, dynamic> data = {"mobile_no": _MobileNumber.text};
    final postResponse =
        await apiService.sendOTP<LoginModel>(ConstantApi.loginUrl, data);
    await LoadingOverlay.hide();

    if (postResponse.status == "True") {
      ShowToastMessage(postResponse.message ?? "");
      accessToken(postResponse.tokenID ?? "");
      UserId(postResponse.data?[0].userId ?? "");
      storeUserInformation(postResponse.data?[0] ?? LoginData());

      final data = await getAddressData();

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
      otpSendResponse();
      // ShowToastMessage(postRespons
      //
      // e.message ?? "");
    }
  }

  //OTP SEND RESPONSE
  Future<void> otpSendResponse() async {
    LoadingOverlay.show(context);

    final apiService = ApiService(ref.read(dioProvider));

    Map<String, dynamic> data = {
      "PhoneNumber": _MobileNumber.text,
    };
    final postResponse =
        await apiService.sendOTP<SuccessModel>(ConstantApi.OTPSendUrl, data);
    await LoadingOverlay.hide();

    if (postResponse.status == "true") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp_Verification_Screen(
                    mobileNo: _MobileNumber.text,
                  )));
    } else {
      ShowToastMessage(postResponse.message ?? "");
    }
  }
}
