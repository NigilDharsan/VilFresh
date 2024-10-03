import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Common_Widgets/Text_Form_Field.dart';

class Survey_Screen extends ConsumerStatefulWidget {
  const Survey_Screen({super.key});

  @override
  ConsumerState<Survey_Screen> createState() => _Survey_ScreenState();
}

class _Survey_ScreenState extends ConsumerState<Survey_Screen> {


  int? _foodType ;
  bool? isFoodSelected;
  TextEditingController _Family = TextEditingController();
  TextEditingController _Kids = TextEditingController();
  TextEditingController _SeniorCity = TextEditingController();
  TextEditingController _birthdaycontoller = TextEditingController();
  TextEditingController _weddingcontoller = TextEditingController();
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
                  child: Text("Survey",style: ProuctGT,)),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 15),
                width: MediaQuery.sizeOf(context).width/1.2,
                  child: Text("*Answer this survey and win 100rs instant cashback",style: whiteHT,maxLines: 2,textAlign: TextAlign.start,)),
              //FULL NAME
              Title_Style(Title: 'How many Adults are there in family?*'),
              textFormField_green(
                hintText: 'Enter Your Family Member',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _Family,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid number";
                  } else if (value == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                onChanged: null,
              ),
              //PINCODE
              Title_Style(Title: 'How many Kids'),
              textFormField_green(
                hintText: 'Enter How many Kinds',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _Kids,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid number";
                  } else if (value == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                onChanged: null,
              ),



              //AREA
              Title_Style(Title: 'How many Senior Citizens'),
              textFormField_green(
                hintText: 'Enter How many Senior Citizens',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _SeniorCity,
                validating: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid number";
                  } else if (value == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                onChanged: null,
              ),
              Title_Style(Title: 'Category (Optional)'),
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

              const SizedBox(height: 15),

              Title_Style(Title: 'Special Days',),

              Text("Birthday Date",style: termsT,),
              const SizedBox(height: 5),
              TextFieldDatePicker(
                Controller: _birthdaycontoller,
                  hintText: 'Birthday Date',
                onTap: () async{
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    String formattedDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                    _birthdaycontoller.text = formattedDate;
                  }
                }
              ),

              const SizedBox(height: 10),

              Text("Wedding Date",style: termsT,),
              const SizedBox(height: 5),
              TextFieldDatePicker(
                  Controller: _weddingcontoller,
                  hintText: 'Birthday Date',
                  onTap: () async{
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      String formattedDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                      _weddingcontoller.text = formattedDate;
                    }
                  }
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: CommonElevatedButton(context,"Next",(){
                  SurveyResponse();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //SURVEY RESPONSE
 SurveyResponse() async{
    final surveyApiService  = ApiService(ref.read(dioProvider));

    Map<String, dynamic> formData = {
      "Question_ID":["1",'2',"3",_foodType == 0?"4":"5"],
      "Answer":["${_Family.text},${_Kids.text},${_SeniorCity.text},${_foodType == 0?"Vegetarian":"Non-Vegetarian"}"],
      "User_ID":await getuserId(),
    };
    final surveyApiResponse = await surveyApiService.AddSurveyApiService(formData: formData);

    if(surveyApiResponse?.status == "true"){
      print("ADD SURVEY SUCCESS");
      ShowToastMessage(surveyApiResponse?.message ?? "");
    }else{
      print("ADD SURVEY ERROR");
      ShowToastMessage(surveyApiResponse?.message ?? "");
    }
 }
}
