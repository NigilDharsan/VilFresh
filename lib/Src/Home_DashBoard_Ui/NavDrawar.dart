import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/HelpSupportHome.dart';
import 'package:vilfresh/Src/Holidays_Ui/Holidays_Screen.dart';
import 'package:vilfresh/Src/Language/LanguageList.dart';
import 'package:vilfresh/Src/Refer_And_Earn_Ui/Refer_And_Earn_Screen.dart';
import 'package:vilfresh/Src/Terms_Conditions_Ui/Terms_Condition_Screen.dart';
import 'package:vilfresh/Src/Wallet_History_Ui/Wallet_History_Screen.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white1,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: green4,
                ),
                child: Center(
                  child: SizedBox(
                      height: 120, width: 120, child: ImgPathPng('logo.png')),
                ),
              ),
              //HOME
              SideMenu(
                  IconImg: 'home.png',
                  menuName: 'Home',
                  onTap: () {
                    var parentState = context
                        .findAncestorStateOfType<Bottom_Navigation_BarState>();

                    if (parentState != null) {
                      parentState.setState(() {
                        parentState.b(0);
                      });
                    } // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Bottom_Navigation_Bar(select: 0)));
                  }),
              //MY ORDER
              SideMenu(
                  IconImg: 'Basket.png',
                  menuName: 'My Orders',
                  onTap: () {
                    var parentState = context
                        .findAncestorStateOfType<Bottom_Navigation_BarState>();

                    if (parentState != null) {
                      parentState.setState(() {
                        parentState.b(2);
                      });
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => My_Order_Screen(
                    //               isMore: true,
                    //             )));
                  }),

              //HOLIDAYS
              SideMenu(
                  IconImg: 'T&C.png',
                  menuName: 'Holidays',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Holidays_screen()));
                  }),
              //TOP UP
              SideMenu(
                  IconImg: 'Topup.png',
                  menuName: 'Topup Wallet',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Wallet_Screen()));
                  }),
              //WALLET
              SideMenu(
                  IconImg: 'Walet.png',
                  menuName: 'Wallet History',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Wallet_History_Screen()));
                  }),
              //Subscription
              // SideMenu(
              //     IconImg: 'subscribe.png',
              //     menuName: 'Subscription',
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Subscribed_Item_Screen()));
              //     }),
              //Language
              SideMenu(
                  IconImg: 'language.png',
                  menuName:
                      "Language", //AppLocalizations.of(context)!.language,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguagePage()),
                    );
                  }),
              //Refer & Earn
              SideMenu(
                  IconImg: 'Referandearn.png',
                  menuName: 'Refer & Earn',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Refer_And_Earn_Screen()));
                  }),
              //Packet return request
              // SideMenu(
              //     IconImg: 'product.png',
              //     menuName: 'Packet return request',
              //     onTap: () {}),
              //Help & Support
              SideMenu(
                  IconImg: 'Help.png',
                  menuName: 'Help & Support',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpSupportHome()));
                  }),
              //Terms & Conditions
              SideMenu(
                  IconImg: 'T&C.png',
                  menuName: 'Terms & Conditions',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Terms_Condition_Screen()));
                  }),

              //SUBSCRIBED ITEM
              // SideMenu(
              //     IconImg: 'T&C.png',
              //     menuName: 'Subscribed Items',
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Subscribed_Item_Screen()));
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
