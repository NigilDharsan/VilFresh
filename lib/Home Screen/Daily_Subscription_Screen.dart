import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';


class Subscription_Details extends StatefulWidget {
  final String? ltrValue;
  final List<String> ltrOptions;
  const Subscription_Details({Key? key, required this.ltrValue, required this.ltrOptions}) : super(key: key);

  @override
  State<Subscription_Details> createState() => _Subscription_DetailsState();
}

class _Subscription_DetailsState extends State<Subscription_Details> {
  String? ltrValue = "1 Ltr";
  List<String> ltrOptions = [
    "1 Ltr",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Daily Subscription",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: green2),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount:  4,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: green3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: backGround1,
                          child: Center(child: Text('Picture')),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "Cow Milk",
                                  style: SubT,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width / 6,
                                      child: DropdownButtonFormField<String>(
                                        value: ltrValue,
                                        onTap: () {
                                          // Handle onTap event
                                          print("CLICKED");
                                        },
                                        isExpanded: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "1 Ltr",
                                          helperStyle: SubT2,
                                        ),
                                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                                        items: ltrOptions.map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Center(
                                              child: Text(
                                                option,
                                                style: SubT2,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          // Handle onChanged event
                                          // setState(() {
                                          //   ltrValue = newValue;
                                          // });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "₹ 33",
                                        style: SubT2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 24,
                                color: green2,
                                child: Center(child: Text("Subscribe",style: SubT3,)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          )
    );
  }
}

