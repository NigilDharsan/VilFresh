import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Survey_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Appartment_Sign_Up_Screen extends StatefulWidget {
  const Appartment_Sign_Up_Screen({super.key});

  @override
  State<Appartment_Sign_Up_Screen> createState() => _Appartment_Sign_Up_ScreenState();
}

class _Appartment_Sign_Up_ScreenState extends State<Appartment_Sign_Up_Screen> {
  String? appartmentOption;
  List<String> appartmentCommunity = ['Akash Homes', 'TVH Vista', 'KG Mega City'];
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
                  child: Text("Community /\n Apartment",style: ProuctGT,)),

              //SELECT CITY
              Title_Style(Title: 'Community/Apartment Name'),
              dropDownField(
                context,
                value: appartmentOption,
                listValue: appartmentCommunity,
                onChanged: (String? newValue) {
                  setState(() {
                    appartmentOption = newValue;
                  });
                },
                hintT: 'Select the floor',
              ),
              //FULL NAME
              Title_Style(Title: 'Flat / House No'),
              textFormField_green(
                hintText: 'Enter Flat Number',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _fullName,
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
                Controller: _fullName,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey_Screen()));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
