import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Login_Ui/Login_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';
class Sign_In_Screen extends StatefulWidget {
  const Sign_In_Screen({super.key});

  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
         Stack(
           children: [
             Container(
               height: 350,
                 width: 350,
                 child: ImgPathSvg('logoback.svg')),
             Positioned(
               top: 10,
               left: 90,
               right: 60,
               child: Container(
                 height: 300,
                   width: 300,
                   child: ImgPathPng('logo.png')),
             ),
           ],
         ),
          const SizedBox(height: 35,),
          Text("Freshly Produced ",style: appLoginT),
          Text("ORGANIC",style:appLoginT1,),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: green1,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
            ),
            child:Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 50),
              child: Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: CommonElevatedButton(context, "Sign In", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                }),
              ),
            ),
            ),

        ],
      ),
    );
  }
}
