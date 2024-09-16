import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Model/CityModel.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Independent_House_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';
import 'Appartment_Sign_Up_Screen.dart';

class Sign_Up_Screen1 extends ConsumerStatefulWidget {
  const Sign_Up_Screen1({super.key});

  @override
  ConsumerState<Sign_Up_Screen1> createState() => _Sign_Up_Screen1State();
}

class _Sign_Up_Screen1State extends ConsumerState<Sign_Up_Screen1> {
  String? cityOption;
  List<String> cityCategory = ['Coimbatore', 'Chennai', 'Salem'];
  int? _residencyType;
  bool? isResidenceSelected;
  final focus1 = FocusNode();
  List<Cities>? citiesData = [];
  String? cityId;
  TextEditingController _fullName = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _area = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cityData = ref.watch(getCityApiProvider);
    return Scaffold(
        appBar: Custom_AppBar(
          title: "",
          actions: null,
          isNav: true,
          isGreen: true,
        ),
        backgroundColor: green1,
        body: cityData.when(
          data: (data) {
            return SingleChildScrollView(
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
                          "Complete Profile",
                          style: ProuctGT,
                        )),
                    //FULL NAME
                    Title_Style(Title: 'Full Name'),
                    textFormField_green(
                      hintText: 'Enter Your Full Name',
                      keyboardtype: TextInputType.text,
                      inputFormatters: null,
                      Controller: _fullName,
                      validating: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Full Name";
                        } else if (value == null) {
                          return "Please enter a Full Name";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),

                    //EMAIL ADDRESS
                    Title_Style(Title: 'E-Mail'),
                    textFormField_green(
                      hintText: 'Enter Your Email Address ',
                      keyboardtype: TextInputType.text,
                      inputFormatters: null,
                      Controller: _Email,
                      validating: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Email Address";
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return "Please Enter Your Email Address";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),
                    //SELECT CITY
                    Title_Style(Title: 'Select your City'),
                    cityDropDownField(context,
                        listValue: data?.cities ?? [],
                        onChanged: ((x) {
                          focus1.unfocus();
                          setState(() {
                            Cities? result = data?.cities?.firstWhere(
                                (value) => value.cityName == x.searchKey);

                            // Print the result
                            print(result?.cityName);

                            cityId = result?.cityID ?? "";
                          });
                        }),
                        focus: focus1,
                        validator: (x) {
                          if (x!.isEmpty) {
                            return 'Please Select City';
                          }
                          return null;
                        },
                        hintT: 'Please Select City',
                        searchText: (SearchValue) {
                          cityId = SearchValue;
                        }),
                    //PINCODE
                    Title_Style(Title: 'Pincode'),
                    textFormField_green(
                      hintText: 'Enter Your Pincode',
                      keyboardtype: TextInputType.number,
                      inputFormatters: null,
                      Controller: _pincode,
                      validating: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Pincode";
                        } else if (value == null) {
                          return "Please enter a Pincode";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),
                    //AREA
                    Title_Style(Title: 'Area'),
                    textFormField_green(
                      hintText: 'Enter Your Area',
                      keyboardtype: TextInputType.text,
                      inputFormatters: null,
                      Controller: _area,
                      validating: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Area";
                        } else if (value == null) {
                          return "Please enter a Area";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),
                    //RESIDENCY TYPE
                    Title_Style(Title: 'Residency Type'),
                    RadioButton(
                        groupValue1: _residencyType,
                        onChanged1: (value1) {
                          setState(() {
                            _residencyType = value1;
                            isResidenceSelected = true;
                            print("Independent");
                          });
                        },
                        radioTxt1: "Independent",
                        groupValue2: _residencyType,
                        onChanged2: (value2) {
                          setState(() {
                            _residencyType = value2;
                            isResidenceSelected = false;
                            print("Community");
                          });
                        },
                        radioTxt2: 'Community/Apartment'),

                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 50),
                      child: CommonElevatedButton(context, "Next", () {
                        _residencyType == 0
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Independent_House_Screen(
                                          fullName: _fullName.text,
                                          E_Mail: _Email.text,
                                          cityId: cityId ?? "",
                                          pincode: _pincode.text,
                                          Area: _area.text,
                                          ResidenceTyep: _residencyType ?? 0,
                                        )))
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Appartment_Sign_Up_Screen(
                                          fullName: _fullName.text,
                                          E_Mail: _Email.text,
                                          cityId: cityId ?? "",
                                          pincode: _pincode.text,
                                          Area: _area.text,
                                          ResidenceTyep: _residencyType ?? 0,
                                        )));
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }
}
