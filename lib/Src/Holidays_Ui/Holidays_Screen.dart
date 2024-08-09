import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  List<List<DateTime?>> _dateRanges = [];

  List<List<DateTime?>> _selectDateRanges = [];

  void _removeDateRange(int index) {
    setState(() {
      _dateRanges.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Holidays ',
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, bottom: 20),
                          child: Container(
                            height: 20,
                            width: 20,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImgPathPng('cancel.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000),
                              selectedDayTextStyle: holidayT1,
                              selectedRangeDayTextStyle: holidayT1,
                              selectedDayHighlightColor: yellow1,
                              selectedRangeHighlightColor: yellow1,
                              calendarType: CalendarDatePicker2Type.range,
                            ),
                            value: [],
                            onValueChanged: (dates) {
                              setState(() {
                                if (dates.length == 2) {
                                  _selectDateRanges = [];
                                  _selectDateRanges.add(dates);
                                }
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 40, right: 40),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _dateRanges.addAll(_selectDateRanges);
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: yellow1,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child:
                                      Text("Set Holidays", style: holidayT1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
            child: ImgPathSvg("wallet.svg"),
          ),
        ],
        isNav: true,
        isGreen: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: _dateRanges.isEmpty
            ? Center(
                child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImgPathPng('nopreview.png'),
                      Text('Nothing here!'),
                      Text('You dont have any selected date')
                    ],
                  ),
                ),
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _dateRanges.length,
                itemBuilder: (context, index) {
                  final range = _dateRanges[index];
                  final startDate = range[0];
                  final endDate = range[1];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: white1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('MMM d yyyy').format(startDate!),
                                    style: holidayT,
                                  ),
                                  Text(
                                    DateFormat('EEEE').format(startDate),
                                    style: holidayT1,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            ImgPathPng('line.png'),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('MMM d yyyy').format(endDate!),
                                    style: holidayT,
                                  ),
                                  Text(
                                    DateFormat('EEEE').format(endDate),
                                    style: holidayT1,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removeDateRange(index);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                child: ImgPathPng('holidayvector.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
