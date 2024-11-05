import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Model/SurveyModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Survey_Screen extends ConsumerStatefulWidget {
  const Survey_Screen({super.key});

  @override
  ConsumerState<Survey_Screen> createState() => _Survey_ScreenState();
}

class _Survey_ScreenState extends ConsumerState<Survey_Screen> {
  int? _foodType;
  bool? isFoodSelected;
  final TextEditingController _Family = TextEditingController();
  final TextEditingController _Kids = TextEditingController();
  final TextEditingController _SeniorCity = TextEditingController();
  final TextEditingController _birthdaycontoller = TextEditingController();
  final TextEditingController _weddingcontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final surveyData = ref.watch(getSurveyProvider);

    return Scaffold(
      appBar: Custom_AppBar(
        title: "",
        actions: null,
        isNav: true,
        isGreen: true,
      ),
      backgroundColor: green1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //COMPLETE PROFILE
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Survey",
                    style: ProuctGT,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: Text(
                    "*Answer this survey and win 100rs instant cashback",
                    style: whiteHT,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  )),

              surveyData.when(
                data: (data) {
                  return Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height - 370,
                          child: ListView.builder(
                            itemCount: data?.data?.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return data?.data?[index].type == "textfield"
                                  ? Column(
                                      children: [
                                        Title_Style(
                                            Title:
                                                data?.data?[index].question ??
                                                    ""),
                                        textFormField_green(
                                          hintText:
                                              data?.data?[index].question ?? "",
                                          keyboardtype: TextInputType.number,
                                          inputFormatters: null,
                                          validating: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter a valid number";
                                            } else if (value == null) {
                                              return "Please enter a valid number";
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              data?.data?[index].answer = value;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  : data?.data?[index].type == "radiobox"
                                      ? Column(
                                          children: [
                                            RadioButton(
                                              groupValue1:
                                                  data?.data?[index].answer !=
                                                          ""
                                                      ? int.parse(data
                                                              ?.data?[index]
                                                              .answer ??
                                                          "1")
                                                      : 1,
                                              onChanged1: (value1) {
                                                setState(() {
                                                  setState(() {
                                                    data?.data?[index].answer =
                                                        "${value1}";
                                                  });
                                                  print("Vegetarian");
                                                });
                                              },
                                              radioTxt1:
                                                  data?.data?[index].question ??
                                                      "",
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        )
                                      : data?.data?[index].type == "date"
                                          ? Column(
                                              children: [
                                                TextFieldDatePicker(
                                                    Controller:
                                                        _birthdaycontoller,
                                                    hintText: 'Birthday Date',
                                                    onTap: () async {
                                                      DateTime? selectedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2100),
                                                      );
                                                      if (selectedDate !=
                                                          null) {
                                                        String formattedDate =
                                                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                                        setState(() {
                                                          data?.data?[index]
                                                                  .answer =
                                                              formattedDate;
                                                        });
                                                      }
                                                    }),
                                                SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            )
                                          : data?.data?[index].type ==
                                                  "add more"
                                              ? Container()
                                              : Title_Style(
                                                  Title: data?.data?[index]
                                                          .question ??
                                                      "");
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CommonElevatedButton(context, "Submit", () {
                        SurveyResponse(data?.data ?? []);
                      }),
                    ],
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  return const Text("");
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //SURVEY RESPONSE
  SurveyResponse(List<SurveyData> resData) async {
    final surveyApiService = ApiService(ref.read(dioProvider));

    List<Map<String, dynamic>> dataRe = [];
    for (var i = 0; i < resData.length; i++) {
      final params = {
        "Question_ID": resData[i].iD,
        "Answer": resData[i].answer,
        "Special_Day_Name": "",
        "Person_Name": "",
        "Date": null
      };
      dataRe.add(params);
    }

    Map<String, dynamic> formData = {
      "Data": dataRe,
      "User_ID": await getuserId(),
    };
    final surveyApiResponse =
        await surveyApiService.AddSurveyApiService(formData: formData);

    if (surveyApiResponse.status == "true") {
      print("ADD SURVEY SUCCESS");
      ShowToastMessage(surveyApiResponse.message ?? "");
      Navigator.of(context);
    } else {
      print("ADD SURVEY ERROR");
      ShowToastMessage(surveyApiResponse.message ?? "");
    }
  }
}
