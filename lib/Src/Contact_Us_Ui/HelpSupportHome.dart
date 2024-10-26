import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Add_Help_Support.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Help_Support_List.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

import '../../Common_Widgets/Custom_App_Bar.dart';

class HelpSupportHome extends StatefulWidget {
  const HelpSupportHome({super.key});

  @override
  State<HelpSupportHome> createState() => _HelpSupportHomeState();
}

class _HelpSupportHomeState extends State<HelpSupportHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: 'Help & Support',
          actions: null,
          isNav: true,
          isGreen: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonElevatedButtonGreen(context, "New Support / New Request",
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Add_Help_Support()));
                }),
                const SizedBox(
                  height: 30,
                ),
                CommonElevatedButtonGreen(context, "Issues List & Status", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Help_SupportList()));
                }),
              ],
            ),
          ),
        ));
  }
}
