import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Add_Help_Support.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Help_Support_List.dart';

class HelpSupportHome extends StatefulWidget {
  const HelpSupportHome({super.key});

  @override
  State<HelpSupportHome> createState() => _HelpSupportHomeState();
}

class _HelpSupportHomeState extends State<HelpSupportHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help and Support"),
          centerTitle: true,
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
                          builder: (context) => Add_Help_Support()));
                }),
                SizedBox(
                  height: 30,
                ),
                CommonElevatedButtonGreen(context, "Issues List & Status", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Help_SupportList()));
                }),
              ],
            ),
          ),
        ));
  }
}
