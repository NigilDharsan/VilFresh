import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Holidays_screen extends ConsumerStatefulWidget {
  const Holidays_screen({super.key});

  @override
  ConsumerState<Holidays_screen> createState() => _Holidays_screenState();
}

class _Holidays_screenState extends ConsumerState<Holidays_screen> {
  List<List<DateTime?>> _selectDateRanges = [];

  void _removeDateRange(int index) {
    setState(() {
      // _dateRanges.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final holidayList = ref.watch(HolidayListProvider);
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
                            onTap: () async {
                              final inserHolidayApiService =
                                  ApiService(ref.read(dioProvider));

                              final range = _selectDateRanges[0];
                              final startDate = range[0];
                              final endDate = range[1];

                              Map<String, dynamic> formData = {
                                "From_Date":
                                    DateFormat('dd/MM/yyyy').format(startDate!),
                                "To_Date":
                                    DateFormat('dd/MM/yyyy').format(endDate!),
                                "User_ID": await getuserId(),
                              };
                              final surveyApiResponse =
                                  await inserHolidayApiService
                                      .AddVacationApiService(
                                          formData: formData);

                              if (surveyApiResponse.status == "true") {
                                print("ADD SURVEY SUCCESS");
                                ShowToastMessage(
                                    surveyApiResponse.message ?? "");
                              } else {
                                print("ADD SURVEY ERROR");
                                ShowToastMessage(
                                    surveyApiResponse.message ?? "");
                              }

                              ref.refresh(HolidayListProvider);

                              // setState(() {
                              //   _dateRanges.addAll(_selectDateRanges);
                              // });
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
          child: holidayList.when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data?.data?.length,
                itemBuilder: (context, index) {
                  final startDate = data?.data?[index].fromDate;
                  final endDate = data?.data?[index].toDate;

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
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    dateAndMonth(startDate!),
                                    style: holidayT,
                                  ),
                                  Text(
                                    days(startDate),
                                    style: holidayT1,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Image(
                                height: 2.5,
                                image: AssetImage("lib/assets/line.png")),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    dateAndMonth(endDate!),
                                    style: holidayT,
                                  ),
                                  Text(
                                    days(endDate),
                                    style: holidayT1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
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
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            error: (Object error, StackTrace stackTrace) {
              return Center(
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
              ));
            },
            loading: () => Center(child: CircularProgressIndicator()),
          )),
    );
  }

  String dateAndMonth(String date) {
    DateFormat inputFormat = DateFormat("M/d/yyyy h:mm:ss a");
    DateTime dateTime = inputFormat.parse(date);

    DateFormat outputFormat = DateFormat("MMM dd yyyy");
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  String days(String date) {
    DateFormat inputFormat = DateFormat("M/d/yyyy h:mm:ss a");
    DateTime dateTime = inputFormat.parse(date);
    var outputFormat = DateFormat('EEEE');
    var outputDate = outputFormat.format(dateTime);

    return outputDate;
  }
}
