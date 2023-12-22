import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vilfresh/Home%20Screen/Bottom_Navigation_Bar.dart';

import 'Otp_Request_Screen.dart';
class Otp_Verification_Screen extends StatefulWidget {
  const Otp_Verification_Screen({super.key});

  @override
  State<Otp_Verification_Screen> createState() => _Otp_Verification_ScreenState();
}

class _Otp_Verification_ScreenState extends State<Otp_Verification_Screen> {
  int _timeLeft = 30; // Timer duration in seconds
  bool _isTimerActive = false;
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
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_isTimerActive) {
        _tick();
      } else {
        timer.cancel();
      }
    }
    );
  }
  TextEditingController _OTP1 = TextEditingController();
  TextEditingController _OTP2 = TextEditingController();
  TextEditingController _OTP3 = TextEditingController();
  TextEditingController _OTP4 = TextEditingController();
  TextEditingController _OTP5 = TextEditingController();
  TextEditingController _OTP6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80,bottom: 50),
            child: Center(child: Image.asset("lib/assets/greencart.png",height: 200,width: 200,)),
          ),
          Text("Freshly Produced ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.green.shade900),),
          Text("ORGANIC",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 40,color: Colors.green.shade900),),
          Spacer(),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 5),
                    child: Text("Enter OTP for verification",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),),
                  ),
                  Container(
                    // color: Colors.green,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP1),
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP2),
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP3),
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP4),
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP5),
                        _textFieldOTP(
                            first: true, last: true, controllers: _OTP6),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(
                        onTap:
                         _isTimerActive ? null:
                            () {
                          _startTimer();
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          child:
                          Text(_isTimerActive ? "00:$_timeLeft" : "",
                              // style: changeT,
                              style: TextStyle(color: Colors.red)),
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.topLeft,
                        child:
                        InkWell(
                          onTap: (){
                            _startTimer();
                          },
                          child: Text(
                            _isTimerActive
                                ? 'Resend OTP'
                                : 'Resend OTP',
                            style: TextStyle(
                                color: _isTimerActive
                                    ?  Colors.red
                                    : Color.fromRGBO(34, 152, 255, 1),
                                fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 9,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context) =>  Bottom_Navigation_Bar(select: 0))
                          );
                        },
                        child: Text(
                          "Verify",
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,color: Colors.green.shade900),)
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
  Widget _textFieldOTP({bool? first, bool? last, controllers}) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      // margin: EdgeInsets.only(left: 10),
      child: TextField(
        // controller: controllers,
        // autofocus: true,
        maxLength: 1,
        // onChanged: (value) {
        //   if (value.length == 1) {
        //     FocusScope.of(context).nextFocus();
        //   }
        //   if (value.length == 0) {
        //     setState(() {
        //       FocusScope.of(context).previousFocus();
        //     });
        //   }
        // },
        // showCursor: true,
        textAlign: TextAlign.center,
        // style: OtpTextfield_Style,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
