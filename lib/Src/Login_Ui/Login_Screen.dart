import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Model/SuccessModel.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _MobileNumber.text = "9807654321";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      body: SingleChildScrollView(
        child: Form(key: _formKey, child: _MainBody()),
      ),
    );
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
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
                  //BUTTON
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: CommonElevatedButton(context, "Send OTP", () async {
                      if (_formKey.currentState!.validate()) {
                        LoadingOverlay.show(context);

                        final apiService = ApiService(ref.read(dioProvider));

                        Map<String, dynamic> data = {
                          "PhoneNumber": _MobileNumber.text,
                        };
                        final postResponse =
                            await apiService.sendOTP<SuccessModel>(
                                ConstantApi.OTPSendUrl, data);
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
                    }),
                  ),
                  Text(
                    'By Signing up you agree to our Privacy Policy and Terms& Conditions of use',
                    style: termsT,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
