import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';
class Holidays_screen extends StatefulWidget {
  const Holidays_screen({super.key});

  @override
  State<Holidays_screen> createState() => _Holidays_screenState();
}

class _Holidays_screenState extends State<Holidays_screen> {

  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Holidays ',
        actions: [
          InkWell(
            onTap: (){

              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return
                    Column(
                      children: [
                        CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          selectedRangeHighlightColor: Colors.yellow,
                          calendarType: CalendarDatePicker2Type.range
                        ),
                    value: _dates,
                    onValueChanged: (dates) => _dates = dates,
                    ),

                        //Container(height: 20,width: 50,color: Colors.red,)
                      ],
                    );

                  }
                  );

            },
            child: Icon(
              Icons.add,
              size: 28,
              color: green2,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 20),
              height: 35,
              width: 35,
              child: ImgPathSvg("wallet.svg")),
        ],
        isNav: true,
        isGreen: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: white1,
                            borderRadius: BorderRadius.circular(15)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Oct 20 2020",style: holidayT,),
                                      Text("Tuesday",style: holidayT1,)
                                    ],
                                  ),
                                ),

                                const Spacer(),

                                ImgPathPng('line.png'),

                                const Spacer(),

                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Oct 24 2020",style: holidayT,),
                                      Text("Saturday",style: holidayT1,)
                                    ],
                                  ),
                                ),

                                Container(
                                  height: 25,width: 25,
                                    child: ImgPathPng('holidayvector.png'))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
