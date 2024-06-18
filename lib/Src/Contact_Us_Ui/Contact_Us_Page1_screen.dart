import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Contact_Us_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';
class Contact_Us_Page1_Screen extends StatefulWidget {
  const Contact_Us_Page1_Screen({super.key});

  @override
  State<Contact_Us_Page1_Screen> createState() => _Contact_Us_Page1_ScreenState();
}

class _Contact_Us_Page1_ScreenState extends State<Contact_Us_Page1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: "Contact us", actions: null, isNav: true, isGreen: false),
      body: _Mainbody(),
    );
  }
  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 15,bottom: 20),
                child: Text('We are happy to serve you!',style: contactUsT,maxLines: 2,)),
            Text('Call us',style: radioT,),
            Container(
                margin: EdgeInsets.only(top: 5,bottom: 5),
                child: Text('+91 8825585893',style: numberT,)),
            Text('or',style: radioT,),
            Text('Please drop a message on WhatsApp at',style: radioT,),
            Text('Probe us',style:contactUsT,),
            Center(
              child: Container(
                  height: 300,width: 300,
                  child: InkWell(
                      onTap: (){

                        //POP UP
                        showDialog(context: context, builder: (BuildContext Context){
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Container(
                              height: 280,
                              width: MediaQuery.sizeOf(context).width/2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white1,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Rate Us',style: ButtonT2,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          //STARS
                                          ratingstar(),
                                          ratingstar(),
                                          ratingstar(),
                                          ratingstar(),
                                          ratingstar(),
                                        ],
                                      ),
                                    ),

                                    //COMMENTS
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: textfieldDescription(hintText: 'Comments'),
                                    ),

                                    //SUBMIT BUTTON
                                    const SizedBox(height: 15,),
                                    CommonElevatedButtonGreen(context, "Submit", () {
                                      Navigator.pop(context);
                                    })
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        );
                      },
                      child: ImgPathPng('smile2.png'))),
            ),
            Center(
              child: Container(
                  height: 300,width: 300,
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact_Us_Screen()));
                      },
                      child: ImgPathPng('sad.png'))),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ratingstar (){
  return Container(
      height: 45,width: 45,
      child: ImgPathPng('rating.png'));
}
