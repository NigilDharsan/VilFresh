import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Appartment_Sign_Up_Screen extends ConsumerStatefulWidget {
  final String fullName;
  final String E_Mail;
  final String cityId;
  final String pincode;
  final String Area;
  final int ResidenceTyep;
  const Appartment_Sign_Up_Screen(
      {super.key,
      required this.fullName,
      required this.E_Mail,
      required this.cityId,
      required this.pincode,
      required this.Area,
      required this.ResidenceTyep});

  @override
  ConsumerState<Appartment_Sign_Up_Screen> createState() =>
      _Appartment_Sign_Up_ScreenState();
}

class _Appartment_Sign_Up_ScreenState
    extends ConsumerState<Appartment_Sign_Up_Screen> {
  String? appartmentOption;
  List<String> appartmentCommunity = [
    'Akash Homes',
    'TVH Vista',
    'KG Mega City'
  ];
  bool? isResidenceSelected;
  final TextEditingController _flatNo = TextEditingController();
  final TextEditingController _houseName = TextEditingController();
  final TextEditingController _block = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _landMark = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    "Community /\n Apartment",
                    style: ProuctGT,
                  )),

              //SELECT CITY
              Title_Style(Title: 'Community/Apartment Name'),
              textFormField_green(
                hintText: 'Enter Community/Apartment Name',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _houseName,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Community/Apartment Name";
                  } else if (value == null) {
                    return "Please enter a Community/Apartment Name";
                  }
                  return null;
                },
                onChanged: null,
              ),
              //FULL NAME
              Title_Style(Title: 'Flat / House No'),
              textFormField_green(
                hintText: 'Enter Flat Number',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _flatNo,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Flat Number";
                  } else if (value == null) {
                    return "Please enter a Flat Number";
                  }
                  return null;
                },
                onChanged: null,
              ),

              //EMAIL ADDRESS
              Title_Style(Title: 'Block / Tower'),
              textFormField_green(
                hintText: 'Enter Block / Tower',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _block,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Block / Tower";
                  } else if (value == null) {
                    return "Please enter a Block / Tower";
                  }
                  return null;
                },
                onChanged: null,
              ),

              //PINCODE
              Title_Style(Title: 'Street / Colony'),
              textFormField_green(
                hintText: 'Enter Street / Colony name',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _street,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Street / Colony name";
                  } else if (value == null) {
                    return "Please Enter Street / Colony name";
                  }
                  return null;
                },
                onChanged: null,
              ),
              //AREA
              Title_Style(Title: 'Landmark (Optional)'),
              textFormField_green(
                hintText: 'Add Landmark',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _landMark,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Landmark";
                  } else if (value == null) {
                    return "Please enter a Landmark";
                  }
                  return null;
                },
                onChanged: null,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: CommonElevatedButton(context, "Next", () {
                  SignUpResponse();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SignUpResponse() async {
    final userRegisterApiService = ApiService(ref.read(dioProvider));
    Map<String, dynamic> formData = {
      "Full_Name": widget.fullName,
      "User_ID": await getuserId(),
      "Email_ID": widget.E_Mail,
      "City": widget.cityId,
      "PinCode": widget.pincode,
      "Area": widget.Area,
      "Residency_Type": widget.ResidenceTyep == 0
          ? "Independent"
          : "Community/Apartment Name",
      "House_Flat_No": _flatNo.text,
      "House_Flat_Name": _houseName.text,
      "Floor_No": "",
      "Street_Colony": _street.text,
      "LandMark": _landMark.text,
      "Block": _block.text,
      "Default": "0"
    };
    final userRegisterResponse =
        await userRegisterApiService.UserRegistrationApiService(
            formData: formData);
    if (userRegisterResponse.status == "true") {
      ShowToastMessage(userRegisterResponse.message ?? "");
      print("APARTMENT DETAILS ADDED SUCESS");
      addressAdded(true);

      int count = 0;
      Navigator.of(context).popUntil((route) {
        count++;
        if (count == 2) {
          // Pass the value when two screens are popped
          Navigator.pop(context, true);
          return true; // Stop popping further
        }
        return false; // Continue popping until the condition is met
      });
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const Survey_Screen()));
    } else {
      ShowToastMessage(userRegisterResponse.message ?? "");
      print("APARTMENT DETAILS ERROR");
    }
  }
}
