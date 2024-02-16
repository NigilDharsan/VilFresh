import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

class My_Order_Screen extends StatefulWidget {
  const My_Order_Screen({super.key});

  @override
  State<My_Order_Screen> createState() => _My_Order_ScreenState();
}

class _My_Order_ScreenState extends State<My_Order_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: "My Order", actions: [], isNav: false, isGreen: false,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: _myOrderList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //MY ORDER LIST
Widget _myOrderList(){
  return ListView.builder(
      itemCount:  10,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap:(){
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MyorderList(context),
          ),
        );
      });
}
}
