import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_Calender_Screen extends StatefulWidget {
  const Subscription_Calender_Screen({super.key});

  @override
  State<Subscription_Calender_Screen> createState() => _Subscription_Calender_ScreenState();
}

class _Subscription_Calender_ScreenState extends State<Subscription_Calender_Screen> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(title: "Subscription Calendar", actions: null, isNav: true, isGreen: false,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 color: green2,
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 15),
                       child: Text('Date',style: appTitle2,),
                     ),
                     Dash(
                         direction: Axis.vertical,
                         length: 70,
                         dashLength: 5,
                         dashThickness: 2,
                         dashColor: white1),
                     const Spacer(),
                     Text('Subscribed Products ',style:appTitle2 ,),
                     const Spacer(),
                     Dash(
                         direction: Axis.vertical,
                         length: 70,
                         dashLength: 5,
                         dashThickness: 2,
                         dashColor: white1),
                     Padding(
                       padding: const EdgeInsets.only(left: 15,top: 20,bottom: 20,right: 20),
                       child: Text('Add\nMore',style: appTitle2,),
                     ),
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                 alignment: Alignment.center,
                   child: Text('*Milk Subscription session will be assigned based on your region')),
               Container(
                 margin: EdgeInsets.only(bottom: 35,left: 20,right: 20),
                 child: ListView.builder(
                   itemCount: 4,
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: const EdgeInsets.only(bottom: 15),
                       child: Subscription_Calender_List(context),
                     );

                   },),
               ),
             ],
        ),
      ),
    );
  }
  //SUBSCRIPTION CALENDER
  Widget Subscription_Calender_List(context){
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1,color: white7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //DATE
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                Text('26',style: walletBalanceT,),
                Text('July',style: referT,),
                Text('WED',style: contentT,)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
            height: 450,
            child: VerticalDivider(
              color: white7, // You can set the color of the divider
              thickness: 1, // You can set the thickness of the divider
            ),
          ),
          //DETAIL
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30,bottom: 15),
                  width: MediaQuery.sizeOf(context).width/1.9,
                  child: _detailList()),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
            height: 450,
            child: VerticalDivider(
              color: white7, // You can set the color of the divider
              thickness: 1, // You can set the thickness of the divider
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Icon(Icons.add,color: green2,),
          )
        ],
      ),
    );
  }


}
//DETAIL LIST
Widget _detailList(){
  return ListView.builder(
    itemCount: 7,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _Detail(context),
      );
    },);
}

//DETAIL
Widget _Detail(context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //PRODUCT NAME
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
              width: MediaQuery.sizeOf(context).width/2.7,
              child: Text('A1 Milk Morning',style: enterAmountT,maxLines: 2,)),
          Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              height: 20,
              width: 25,
              child: ImgPathPng('switch.png')),
        ],
      ),
      //QUANTITY
      Text('1.0 Lts',style: referT,)

    ],
  );
}