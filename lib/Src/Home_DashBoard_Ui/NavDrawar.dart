import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Contact_Us_Screen.dart';
import 'package:vilfresh/Src/Holidays_Ui/Holidays_Screen.dart';
import 'package:vilfresh/Src/My_Order_Ui/My_Order_Screen.dart';
import 'package:vilfresh/Src/Refer_And_Earn_Ui/Refer_And_Earn_Screen.dart';
import 'package:vilfresh/Src/Subscription_Calander_Ui/Subscription_Calander_Screen.dart';
import 'package:vilfresh/Src/Wallet_History_Ui/Wallet_History_Screen.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white1,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: green4,
                ),
                child: Center(
                  child: Container(
                      height: 120, width: 120, child: ImgPathPng('logo.png')),
                ),
              ),
              //HOME
              SideMenu(
                  IconImg: 'home.png',
                  menuName: 'Home',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Bottom_Navigation_Bar(select: 0)));
                  }),
              //MY ORDER
              SideMenu(
                  IconImg: 'Basket.png',
                  menuName: 'My Order',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => My_Order_Screen(isMore: true,)));
                  }),
              //TOP UP
              SideMenu(
                  IconImg: 'Topup.png',
                  menuName: 'Topup Wallet',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wallet_Screen()));
                  }),
              //WALLET
              SideMenu(
                  IconImg: 'Walet.png',
                  menuName: 'Wallet History',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Wallet_History_Screen()));
                  }),
              //Subscription
              SideMenu(
                  IconImg: 'subscribe.png',
                  menuName: 'Subscription',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Subscription_Calender_Screen()));
                  }),
              //Language
              SideMenu(
                  IconImg: 'language.png', menuName: 'Language', onTap: () {}),
              //Refer & Earn
              SideMenu(
                  IconImg: 'Referandearn.png',
                  menuName: 'Refer & Earn',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Refer_And_Earn_Screen()));
                  }),
              //Packet return request
              SideMenu(
                  IconImg: 'product.png',
                  menuName: 'Packet return request',
                  onTap: () {}),
              //Help & Support
              SideMenu(
                  IconImg: 'Help.png',
                  menuName: 'Help & Support',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contact_Us_Screen()));
                  }),
              //Terms & Conditions
              SideMenu(
                  IconImg: 'T&C.png',
                  menuName: 'Terms & Conditions',
                  onTap: () {
                  }),


              //HOLIDAYS
              SideMenu(
                  IconImg: 'T&C.png',
                  menuName: 'Holidays',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Holidays_screen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
