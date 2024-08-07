import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Survey_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import 'Common_Button.dart';

Widget Frequency_Pop(context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    height: 220,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom:15),
            child: Text("Freuency",style: ButtonT,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Everyday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                      child: Text("Quantity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),)),

                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Custom_Button(context,customTxt: 'Submit'),
          ),

        ],
      ),
    ),
  );
}
//CUSTOM
Widget Select_EveryDay_Pop(context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    height: 300,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom:15),
            child: Text("Select Delivery day",style: ButtonT,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Every 2nd Day",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                      child: Text("Quantity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),)),

                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Every 3nd Day",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                      child: Text("Quantity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),)),

                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:green5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('-',style: kgT,),
                        ),
                        Text(
                          "1 Kg",style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('+',style: kgT,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Custom_Button(context,customTxt: 'Submit'),
          ),

        ],
      ),
    ),
  );
}

//EVERY DAY POP
Widget EveryDay_Pop(context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom:15),
              child: Text("Select Delivery day",style: ButtonT,),
            ),
            //SUNDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sunday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            //MONDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            //TUESADY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tuesday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            //WEDNESDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wednesday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
           //THRUSDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thursday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            //FRIDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Friday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
           //SATURDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saturday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evening",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: green2),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:green5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('-',style: kgT,),
                          ),
                          Text(
                            "1 Kg",style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Text('+',style: kgT,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 50),
              child: Custom_Button(context,customTxt: 'Submit'),
            ),
      
          ],
        ),
      ),
    ),
  );
}


class EveryDay_Pop2 extends ConsumerStatefulWidget {
  String? deliverydata;
  String? startdate;
  String? varient2;
  EveryDay_Pop2({super.key,required this.deliverydata,required this.startdate});

  @override
  ConsumerState<EveryDay_Pop2> createState() => _EveryDay_Pop2State();
}

class _EveryDay_Pop2State extends ConsumerState<EveryDay_Pop2> {
  final List<String> _days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  final Map<String, Map<String, double>> _counters = {};

  @override
  void initState() {
    super.initState();
    for (String day in _days) {
      _counters[day] = {'Morning': 0.0, 'Evening': 0.0};
    }
  }

  void _incrementCounter(String day, String timeslot) {
    setState(() {
      _counters[day]![timeslot] = _counters[day]![timeslot]! + 0.5;
    });
  }

  void _decrementCounter(String day, String timeslot) {
    setState(() {
      _counters[day]![timeslot] = (_counters[day]![timeslot]! > 0.0)
          ? (_counters[day]![timeslot]! - 0.5).clamp(0.0, double.infinity)
          : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
              child: Text("Select Delivery day", style: ButtonT),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 1.5,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _days.length,
                  itemBuilder: (context, index) {
                    String dayName = _days[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dayName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: green2)),
                            ],
                          ),
                          Spacer(),
                          // Morning
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Morning", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: green2)),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _decrementCounter(dayName, 'Morning');
                                        },
                                        child: Text('-', style: kgT),
                                      ),
                                    ),
                                    Text(
                                      "${_counters[dayName]!['Morning']!.toStringAsFixed(1)} Kg", style: kgT,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _incrementCounter(dayName, 'Morning');
                                        },
                                        child: Text('+', style: kgT),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          // Evening
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Evening", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: green2)),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _decrementCounter(dayName, 'Evening');
                                        },
                                        child: Text('-', style: kgT),
                                      ),
                                    ),
                                    Text(
                                      "${_counters[dayName]!['Evening']!.toStringAsFixed(1)} Kg", style: kgT,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _incrementCounter(dayName, 'Evening');
                                        },
                                        child: Text('+', style: kgT),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Custom_Button(context, customTxt: 'Submit'),
            )
          ],
        ),
      ),
    );
  }
  selectdeliveryday()async{
    final selectdeliveryApiService = ApiService(ref.read(dioProvider));
    Map<String, dynamic> formData = {
      "User_ID":await getuserId(),
      "Item_ID": widget.deliverydata,
      "From_Date":widget.startdate,
      "To_Date":"",
      "Item_Variant_ID":widget.varient2,
    };
    final selecteddeliveryResponse = await selectdeliveryApiService.SubscribeApiService(formData: formData);
    if(selecteddeliveryResponse?.status == "true"){
      ShowToastMessage(selecteddeliveryResponse?.message ?? "");
      print("");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey_Screen()));
    }else{
      ShowToastMessage(selecteddeliveryResponse?.message ?? "");
      print("");
    }
  }
}
