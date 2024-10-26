import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Contact_Us_Screen extends StatefulWidget {
  const Contact_Us_Screen({super.key});

  @override
  State<Contact_Us_Screen> createState() => _Contact_Us_ScreenState();
}

class _Contact_Us_ScreenState extends State<Contact_Us_Screen> {
  final TextEditingController _comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
          title: "Contact us", actions: null, isNav: true, isGreen: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 20),
                  child: Text(
                    'We are happy to serve you!',
                    style: contactUsT,
                    maxLines: 2,
                  )),
              Text(
                'Call us',
                style: radioT,
              ),
              //NUMBER
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    '+91 8825585893',
                    style: numberT,
                  )),
              Text(
                'or',
                style: radioT,
              ),
              Text(
                'Please drop a message on WhatsApp at',
                style: radioT,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Text(
                    '+91 8825585893',
                    style: numberT,
                  )),
              //COMMENT
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Raise a Ticket",
                          style: ButtonT2,
                        ),
                      ),
                      ticketCategory(subText: 'Category'),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: ticketCategory(subText: 'Category'),
                      ),
                      //COMMENT
                      textfieldDescription(
                          hintText: 'Comment',
                          Controller: _comment,
                          validating: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a Flat Number";
                            } else if (value == null) {
                              return "Please enter a Flat Number";
                            }
                            return null;
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child:
                            CommonElevatedButtonGreen(context, "Submit", () {}),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketCategory({required String subText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catgory',
          style: radioT,
        ),
        const SizedBox(
          width: 25,
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          size: 25,
        )
      ],
    );
  }
}
