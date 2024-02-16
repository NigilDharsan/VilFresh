import 'package:flutter/material.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
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