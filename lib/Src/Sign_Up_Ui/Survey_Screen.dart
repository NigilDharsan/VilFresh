import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Survey_Screen extends StatefulWidget {
  const Survey_Screen({super.key});

  @override
  State<Survey_Screen> createState() => _Survey_ScreenState();
}

class _Survey_ScreenState extends State<Survey_Screen> {
  String? adultOption;
  List<String> adultCategory = ['1', '2', '3'];
  String? kidOption;
  List<String> kidCategory = ['1', '2', '3'];
  String? seniorOption;
  List<String> senior = ['1', '2', '3'];

  int? _foodType ;
  bool? isFoodSelected;

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
                  child: Text("Survey",style: ProuctGT,)),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 15),
                width: MediaQuery.sizeOf(context).width/1.2,
                  child: Text("*Answer this survey and win 100rs instant cashback",style: whiteHT,maxLines: 2,textAlign: TextAlign.start,)),
              //FULL NAME
              Title_Style(Title: 'How many Adults are there in family?*'),
              dropDownField(
                context,
                value: adultOption,
                listValue: adultCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    adultOption = newValue;
                  });
                },
                hintT: 'Enter your answer',
              ),
              //PINCODE
              Title_Style(Title: 'How many Kids*'),
              dropDownField(
                context,
                value: kidOption,
                listValue: kidCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    kidOption = newValue;
                  });
                },
                hintT: 'Enter your answer',
              ),
              //AREA
              Title_Style(Title: 'How many Senior Citizens*'),
              dropDownField(
                context,
                value: kidOption,
                listValue: kidCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    kidOption = newValue;
                  });
                },
                hintT: 'Enter your answer',
              ),
              const SizedBox(height: 15,),
              RadioButton(
                  groupValue1: _foodType,
                  onChanged1: (value1) {
                    setState(() {
                      _foodType = value1;
                      isFoodSelected = true;
                      print("Vegetarian");
                    });
                  },
                  radioTxt1: "Vegetarian",
                  groupValue2: _foodType,
                  onChanged2: (value2) {
                    setState(() {
                      _foodType = value2;
                      isFoodSelected = false;
                      print("Non-Vegetarian");
                    });
                  },
                  radioTxt2: 'Non-Vegetarian'),

              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: CommonElevatedButton(context,"Next",(){}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
