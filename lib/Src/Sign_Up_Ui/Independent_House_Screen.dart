import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Appartment_Sign_Up_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Independent_House_Screen extends StatefulWidget {
  const Independent_House_Screen({super.key});

  @override
  State<Independent_House_Screen> createState() => _Independent_House_ScreenState();
}

class _Independent_House_ScreenState extends State<Independent_House_Screen> {
  String? floorOption;
  List<String> floorCategory = ['1st', '2nd', '3rd'];
  int? _residencyType ;
  bool? isResidenceSelected;

  @override
  Widget build(BuildContext context) {
    TextEditingController _fullName = TextEditingController();
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
                Controller: _fullName,
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
                Controller: _fullName,
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
              dropDownField(
                context,
                value: floorOption,
                listValue: floorCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    floorOption = newValue;
                  });
                },
                hintT: 'Select the floor',
              ),
              //PINCODE
              Title_Style(Title: 'Street / Colony'),
              textFormField_green(
                hintText: 'Enter Street / Colony name',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _fullName,
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
                Controller: _fullName,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Appartment_Sign_Up_Screen()));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
