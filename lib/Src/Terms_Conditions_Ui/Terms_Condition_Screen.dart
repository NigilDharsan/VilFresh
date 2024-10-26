import 'package:flutter/material.dart';

import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Common_Colors.dart';

class Terms_Condition_Screen extends StatefulWidget {
  const Terms_Condition_Screen({super.key});

  @override
  State<Terms_Condition_Screen> createState() => _Terms_Condition_ScreenState();
}

class _Terms_Condition_ScreenState extends State<Terms_Condition_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Terms & Conditions',
        actions: null,
        isNav: true,
        isGreen: false,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            Text(
                "An Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.\r\nA Termination clause will inform users that any accounts on your website and mobile app, or user\"s access to your website and app, can be terminated in case of abuses or at your sole discretion.\r\nA Governing Law clause will inform users which laws govern the agreement. These laws should come from the country in which your company is headquartered or the country from which you operate your website and mobile app.\r\nA Links to Other Websites clause will inform users that you are not responsible for any third party websites that you link to. This kind of clause will generally inform users that they are responsible for reading and agreeing (or disagreeing) with the Terms and Conditions or Privacy Policies of these third parties.")
          ],
        ),
      ),
    );
  }
}
