import 'package:flutter/material.dart';
import 'package:vilfresh/Src/Sign_In_Screen_Ui/SignIn_Screen.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';

import 'Home Screen/Cart_Screen.dart';
import 'Home Screen/Daily_Subscription_Screen.dart';
import 'Src/Categories_Ui/Categories_Screen.dart';
import 'Src/Checkout_Ui/Checkout_Screen.dart';
import 'Src/Contact_Us_Ui/Contact_Us_Screen.dart';
import 'Src/Farmer_Detail_Ui/Farmer_Detail_Screen.dart';
import 'Src/Login_Ui/Login_Screen.dart';
import 'Src/My_Order_Ui/My_Order_Screen.dart';
import 'Src/OTP_Verification_Ui/Otp_Verfication_Screen.dart';
import 'Src/Product_Description_Ui/Product_Description_Screen.dart';
import 'Src/Refer_And_Earn_Ui/Refer_And_Earn_Screen.dart';
import 'Src/Sign_Up_Ui/Appartment_Sign_Up_Screen.dart';
import 'Src/Sign_Up_Ui/Independent_House_Screen.dart';
import 'Src/Sign_Up_Ui/Sign_Up_Screen1.dart';
import 'Src/Sign_Up_Ui/Survey_Screen.dart';
import 'Src/Subscription_Calander_Ui/Subscription_Calander_Screen.dart';
import 'Src/Subscription_Checkout_Ui/Subscription_CheckOut_Screen.dart';
import 'Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'Src/Wallet_History_Ui/Wallet_History_Screen.dart';
import 'Src/Wallet_Ui/Wallet_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Login_Screen() //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

