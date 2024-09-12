import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Refer_And_Earn_Screen extends StatefulWidget {
  const Refer_And_Earn_Screen({super.key});

  @override
  State<Refer_And_Earn_Screen> createState() => _Refer_And_Earn_ScreenState();
}

class _Refer_And_Earn_ScreenState extends State<Refer_And_Earn_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: "Refer and Earn",
        actions: [WalletCount()],
        isNav: true,
        isGreen: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: _MainBody(),
      ),
    );
  }

//MAIN BODY
  Widget _MainBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //REFERAL CARD
          _referalCard(),
          const SizedBox(height: 30),
          //REFERAL BUTTON
          _referalButton(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

//REFERAL CARD
  Widget _referalCard() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(top: 30),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: white1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //REFER IMAGE
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              height: 180,
              width: 180,
              child: ImgPathPng("refer.png")),
          //REFER TEXT
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Text(
              "Earn Rs. 250 for every friend you refer",
              style: walletBalanceT1,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          //TERMS AND CONDITION
          Text(
            'Tearms and conditions apply',
            style: referT,
          ),
          //HOW IT WORKS BUTTON
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: white8),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 45, right: 45),
              child: Text(
                'How it works',
                style: amountT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //REFERAL BUTTON
  Widget _referalButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Share.share('VilFresh');
          },
          child: Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: yellow1),
            child: Center(
                child: Text(
              "Share link to my friend",
              style: ButtonT2,
            )),
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     Share.share('VilFresh');
        //   },
        //   child: Container(
        //     height: 50,
        //     margin: EdgeInsets.only(top: 30, bottom: 50),
        //     width: MediaQuery.sizeOf(context).width,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(25),
        //         border: Border.all(width: 2, color: Colors.black)),
        //     child: Center(
        //         child: Text(
        //       "Copy my referral link",
        //       style: ButtonT2,
        //     )),
        //   ),
        // ),
      ],
    );
  }
}
