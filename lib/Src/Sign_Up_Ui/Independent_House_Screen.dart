import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Appartment_Sign_Up_Screen.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Survey_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Independent_House_Screen extends ConsumerStatefulWidget {
  final String fullName;
  final String E_Mail;
  final String cityId;
  final String pincode;
  final String Area;
  final int ResidenceTyep;
  Independent_House_Screen({super.key, required this.fullName,required this.E_Mail,required this.cityId, required this.pincode, required this.Area, required this.ResidenceTyep});

  @override
  ConsumerState<Independent_House_Screen> createState() => _Independent_House_ScreenState();
}

class _Independent_House_ScreenState extends ConsumerState<Independent_House_Screen> {
  String? floorOption;
  List<String> floorCategory = ['1st', '2nd', '3rd'];
  bool? isResidenceSelected;
  TextEditingController _HouseNumb = TextEditingController();
  TextEditingController _HouseName = TextEditingController();
  TextEditingController _floorNo = TextEditingController();
  TextEditingController _StreetName = TextEditingController();
  TextEditingController _LandMark = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Custom_AppBar(title: "", actions: null, isNav: true, isGreen: true,),
      backgroundColor: green1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //COMPLETE PROFILE
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Independent House",style: ProuctGT,)),
              //FULL NAME
              Title_Style(Title: 'House No'),
              textFormField_green(
                hintText: 'Enter House Number',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _HouseNumb,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a House Number";
                  } else if (value == null) {
                    return "Please enter a House Number";
                  }
                  return null;
                },
                onChanged: null,
              ),

              //EMAIL ADDRESS
              Title_Style(Title: 'House Name (Optional)'),
              textFormField_green(
                hintText: 'Enter House Name ',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _HouseName,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a House Name";
                  } else if (value == null) {
                    return "Please enter a House Name";
                  }
                  return null;
                },
                onChanged: null,
              ),
              //SELECT CITY
              Title_Style(Title: 'Floor Number'),
              textFormField_green(
                hintText: 'Enter Floor Number',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _floorNo,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Floor Number";
                  } else if (value == null) {
                    return "Please Enter Floor Number";
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
                Controller: _StreetName,
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
                Controller: _LandMark,
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
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: CommonElevatedButton(context,"Next",(){
                  SignUpResponse();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  SignUpResponse() async{
    final userRegisterApiService = ApiService(ref.read(dioProvider));
    Map<String, dynamic> formData = {
      "Full_Name":widget.fullName,
      "User_ID":await getuserId(),
      "Email_ID":widget.E_Mail,
      "City":widget.cityId,
      "PinCode":widget.pincode,
      "Area":widget.Area,
      "Residency_Type":widget.ResidenceTyep == 0?"Independent":"Community/Apartment Name",
      "House_Flat_No":_HouseNumb.text,
      "House_Flat_Name":_HouseName.text,
      "Floor_No":_floorNo.text,
      "Street_Colony":_StreetName.text,
      "LandMark":_LandMark.text,
      "Block":'',
      "Default":"0"
    };
    final userRegisterResponse = await userRegisterApiService.UserRegistrationApiService(formData: formData);
    if(userRegisterResponse?.status == "true"){
      ShowToastMessage(userRegisterResponse?.message ?? "");
      print("APARTMENT DETAILS ADDED SUCESS");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey_Screen()));
    }else{
      ShowToastMessage(userRegisterResponse?.message ?? "");
      print("APARTMENT DETAILS ERROR");
    }
  }
}
