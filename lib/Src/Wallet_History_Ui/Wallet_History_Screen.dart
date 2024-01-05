import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Wallet_History_Screen extends StatefulWidget {
  const Wallet_History_Screen({super.key});

  @override
  State<Wallet_History_Screen> createState() => _Wallet_History_ScreenState();
}

class _Wallet_History_ScreenState extends State<Wallet_History_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: "Wallet History", actions: [
        Container(
                 margin: EdgeInsets.only(right: 20),
          height:35,width:35,child: ImgPathSvg("wallet.svg"))], isNav: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              _noTransaction(),
            ],
        ),
      ),
    );
  }
  //NO TRANSACTION DATA
 Widget _noTransaction(){
    return  Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white1,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20,bottom: 10),
                height: 100,
                width: 100,
                child: ImgPathPng('logo.png')),
            Text('Nothing here!',style: Textfield_Style2,),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 30),
              child: Text('You don’t have any transactions. Keep adding money to your wallet.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: radioT,
              ),
            )
          ],
        ),
      ),
    );
 }
}
