import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/OtherCategoriesModel.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Survey_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import 'Common_Button.dart';

Widget Frequency_Pop(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    height: 220,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Freuency",
              style: ButtonT,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Everyday",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      )),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: green5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '-',
                            style: kgT,
                          ),
                        ),
                        Text(
                          "1",
                          style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '+',
                            style: kgT,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Evening",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: green2),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10), color: green5),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 10, right: 10, top: 10, bottom: 10),
              //             child: Text(
              //               '-',
              //               style: kgT,
              //             ),
              //           ),
              //           Text(
              //             "1 Kg",
              //             style: kgT,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 10, right: 10, top: 10, bottom: 10),
              //             child: Text(
              //               '+',
              //               style: kgT,
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Custom_Button(context, customTxt: 'Submit', onTap: () {}),
          ),
        ],
      ),
    ),
  );
}

//CUSTOM
Widget Select_EveryDay_Pop(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    height: 300,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Select Delivery day",
              style: ButtonT,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Every 2nd Day",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      )),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: green5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '-',
                            style: kgT,
                          ),
                        ),
                        Text(
                          "1 Kg",
                          style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '+',
                            style: kgT,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evening",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: green5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '-',
                            style: kgT,
                          ),
                        ),
                        Text(
                          "1 Kg",
                          style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '+',
                            style: kgT,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Every 3nd Day",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      )),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: green5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '-',
                            style: kgT,
                          ),
                        ),
                        Text(
                          "1 Kg",
                          style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '+',
                            style: kgT,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evening",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: green5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '-',
                            style: kgT,
                          ),
                        ),
                        Text(
                          "1 Kg",
                          style: kgT,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            '+',
                            style: kgT,
                          ),
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
            child: Custom_Button(context, customTxt: 'Submit', onTap: () {}),
          ),
        ],
      ),
    ),
  );
}

//EVERY DAY POP
Widget EveryDay_Pop(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "Select Delivery day",
                style: ButtonT,
              ),
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
                    Text(
                      "Sunday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //MONDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //TUESADY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tuesday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //WEDNESDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wednesday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //THRUSDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thursday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //FRIDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //SATURDAY
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saturday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1 Kg",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Evening",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: kgT,
                            ),
                          ),
                          Text(
                            "1",
                            style: kgT,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: kgT,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Custom_Button(context, customTxt: 'Submit', onTap: () {}),
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
  EveryDay_Pop2(
      {super.key, required this.deliverydata, required this.startdate});

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

  final Map<String, Map<String, int>> _counters = {};

  @override
  void initState() {
    super.initState();
    for (String day in _days) {
      _counters[day] = {
        'Morning': 0,
      }; //'Evening': 0.0
    }
  }

  void _incrementCounter(String day, String timeslot) {
    setState(() {
      _counters[day]![timeslot] = _counters[day]![timeslot]! + 1;
    });
  }

  void _decrementCounter(String day, String timeslot) {
    setState(() {
      _counters[day]![timeslot] = (_counters[day]![timeslot]! > 0)
          ? (_counters[day]![timeslot]! - 1)
          : 0;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Select Delivery day",
                    style: ButtonT,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Text("Morning",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 2.4,
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
                              Text(dayName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: green2)),
                            ],
                          ),
                          Spacer(),
                          // Morning
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: green5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _decrementCounter(dayName, 'Morning');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Text('-', style: kgT),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        "${_counters[dayName]!['Morning']!}",
                                        style: kgT,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _incrementCounter(dayName, 'Morning');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
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
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("Evening",
                          //         style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w400,
                          //             color: green2)),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: green5),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           Padding(
                          //             padding: const EdgeInsets.only(
                          //                 left: 10,
                          //                 right: 10,
                          //                 top: 10,
                          //                 bottom: 10),
                          //             child: InkWell(
                          //               onTap: () {
                          //                 _decrementCounter(dayName, 'Evening');
                          //               },
                          //               child: Text('-', style: kgT),
                          //             ),
                          //           ),
                          //           Text(
                          //             "${_counters[dayName]!['Evening']!.toStringAsFixed(1)} Kg",
                          //             style: kgT,
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.only(
                          //                 left: 10,
                          //                 right: 10,
                          //                 top: 10,
                          //                 bottom: 10),
                          //             child: InkWell(
                          //               onTap: () {
                          //                 _incrementCounter(dayName, 'Evening');
                          //               },
                          //               child: Text('+', style: kgT),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Custom_Button(context, customTxt: 'Submit', onTap: () {
                ShowToastMessage('Custom Subscription Added');
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }

  selectdeliveryday() async {
    final selectdeliveryApiService = ApiService(ref.read(dioProvider));
    Map<String, dynamic> formData = {
      "User_ID": await getuserId(),
      "Item_ID": widget.deliverydata,
      "From_Date": widget.startdate,
      "To_Date": "",
      "Item_Variant_ID": widget.varient2,
    };
    final selecteddeliveryResponse =
        await selectdeliveryApiService.SubscribeApiService(formData: formData);
    if (selecteddeliveryResponse?.status == "true") {
      ShowToastMessage(selecteddeliveryResponse?.message ?? "");
      print("");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Survey_Screen()));
    } else {
      ShowToastMessage(selecteddeliveryResponse?.message ?? "");
      print("");
    }
  }
}

class Frequency_PopUp extends ConsumerStatefulWidget {
  String? deliverydata;
  String? startdate;
  String? varient2;
  Frequency_PopUp(
      {super.key, required this.deliverydata, required this.startdate});

  @override
  ConsumerState<Frequency_PopUp> createState() => _Frequency_PopUpState();
}

class _Frequency_PopUpState extends ConsumerState<Frequency_PopUp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "Frequency",
                  style: ButtonT,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Everyday",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: green2),
                          )),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Morning",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: green5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                _decrement();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Text(
                                  '-',
                                  style: kgT,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "${_counter}",
                                style: kgT,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _increment();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Text(
                                  '+',
                                  style: kgT,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Evening",
                  //       style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400,
                  //           color: green2),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10), color: green5),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 left: 10, right: 10, top: 10, bottom: 10),
                  //             child: Text(
                  //               '-',
                  //               style: kgT,
                  //             ),
                  //           ),
                  //           Text(
                  //             "1 Kg",
                  //             style: kgT,
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 left: 10, right: 10, top: 10, bottom: 10),
                  //             child: Text(
                  //               '+',
                  //               style: kgT,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Custom_Button(
                  context,
                  customTxt: 'Submit',
                  onTap: () {
                    ShowToastMessage('Daily Subscription Added');
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemIncrement_PopUp extends ConsumerStatefulWidget {
  ItemDetail categoryData;
  ItemIncrement_PopUp({super.key, required this.categoryData});

  @override
  ConsumerState<ItemIncrement_PopUp> createState() =>
      _ItemIncrement_PopUpState();
}

class _ItemIncrement_PopUpState extends ConsumerState<ItemIncrement_PopUp> {
  int _counter = 0;

  // void _increment() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrement() {
  //   setState(() {
  //     if (_counter != 0) {
  //       _counter--;
  //     }
  //   });
  // }

  Future<void> _increment(String VARIANT_ID) async {
    _counter++;

    if (_counter == 1) {
      LoadingOverlay.show(context);

      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": widget.categoryData.itemID,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "1"
          }
        ],
      };

      final result = await ref.read(AddToCardProvider(formData).future);

      LoadingOverlay.forcedStop();
      // Handle the result
      if (result?.status == true) {
        ShowToastMessage(result?.message ?? "");
        // ref.refresh(ProductDetailProvider(formData1));
        // Handle success
      } else {
        // Handle failure
        ShowToastMessage(result?.message ?? "");
      }
    } else {
      LoadingOverlay.show(context);
      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": widget.categoryData.itemID,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "${_counter}"
          }
        ],
      };

      final result = await ref.read(
        AddToCardUpdateProvider(formData).future,
      );
      LoadingOverlay.forcedStop();
      if (result?.status == "true") {
        ShowToastMessage(result?.message ?? "");
        // ref.refresh(ProductDetailProvider(formData1));
      } else {
        ShowToastMessage(result?.message ?? "");
      }
    }
  }

  Future<void> _decrement(String VARIANT_ID) async {
    if (_counter != 0) {
      _counter--;

      if (_counter == 0) {
        LoadingOverlay.show(context);

        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": widget.categoryData.itemID,
              "CI_VARIANT_TYPE": VARIANT_ID,
              "CI_ITEM_QTY": "1"
            }
          ],
        };

        final result = await ref.read(AddToCardDeleteProvider(formData).future);

        LoadingOverlay.forcedStop();
        // Handle the result
        if (result?.status == true) {
          ShowToastMessage(result?.message ?? "");
          // ref.refresh(ProductDetailProvider(formData1));
          // Handle success
        } else {
          // Handle failure
          ShowToastMessage(result?.message ?? "");
        }
      } else {
        LoadingOverlay.show(context);
        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": widget.categoryData.itemID,
              "CI_VARIANT_TYPE": VARIANT_ID,
              "CI_ITEM_QTY": "${_counter}"
            }
          ],
        };

        final result = await ref.read(
          AddToCardUpdateProvider(formData).future,
        );
        LoadingOverlay.forcedStop();
        if (result?.status == "true") {
          ShowToastMessage(result?.message ?? "");
          // ref.refresh(ProductDetailProvider(formData1));
        } else {
          ShowToastMessage(result?.message ?? "");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalAmount = widget.categoryData.allVariant!
        .map((variant) =>
            int.parse(variant.itemQty ?? "") *
            int.parse(variant.sellingPrice ?? ""))
        .reduce((a, b) => a + b);

    return Scaffold(
        body: Container(
            height: (widget.categoryData.allVariant?.length ?? 0) * 100 + 100,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      widget.categoryData.item ?? "",
                      style: productNameT,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.categoryData.allVariant?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 10, left: 15, right: 15),
                        child: Container(
                          height: 70,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 0.5, color: grey1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              widget.categoryData.itemImage ??
                                                  ""))),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    "${widget.categoryData.allVariant?[index].variantName ?? ""} x ${widget.categoryData.allVariant?[index].itemQty ?? ""}",
                                    style: kgT,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  widget.categoryData.allVariant?[index]
                                          .sellingPrice ??
                                      "",
                                  style: kgT,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.categoryData.allVariant?[index]
                                          .actualPrice ??
                                      "",
                                  style: offerStrikeT,
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: green5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          int.parse(widget.categoryData
                                                  .allVariant?[index].itemQty ??
                                              "");
                                          _decrement(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .variantID ??
                                              "");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '-',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "${_counter}",
                                          //"${categoryData.allVariant?[index].itemQty ?? ""}",
                                          style: kgT,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _counter = int.parse(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .itemQty ??
                                              "");
                                          _increment(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .variantID ??
                                              "");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '+',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 30),
                    child: Container(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: green1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Text(
                              "Total Item Price:",
                              style: appTitle2,
                            ),
                            const Spacer(),
                            Text(
                              "₹ ${totalAmount}",
                              style: appTitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ItemIncrement_PopUp1 extends ConsumerStatefulWidget {
  OtherItemDetail categoryData;
  ItemIncrement_PopUp1({super.key, required this.categoryData});

  @override
  ConsumerState<ItemIncrement_PopUp1> createState() =>
      _ItemIncrement_PopUpState1();
}

class _ItemIncrement_PopUpState1 extends ConsumerState<ItemIncrement_PopUp1> {
  int _counter = 0;

  // void _increment() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrement() {
  //   setState(() {
  //     if (_counter != 0) {
  //       _counter--;
  //     }
  //   });
  // }

  Future<void> _increment(String VARIANT_ID) async {
    _counter++;

    if (_counter == 1) {
      LoadingOverlay.show(context);

      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": widget.categoryData.itemID,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "1"
          }
        ],
      };

      final result = await ref.read(AddToCardProvider(formData).future);

      LoadingOverlay.forcedStop();
      // Handle the result
      if (result?.status == true) {
        ShowToastMessage(result?.message ?? "");
        // ref.refresh(ProductDetailProvider(formData1));
        // Handle success
      } else {
        // Handle failure
        ShowToastMessage(result?.message ?? "");
      }
    } else {
      LoadingOverlay.show(context);
      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": widget.categoryData.itemID,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "${_counter}"
          }
        ],
      };

      final result = await ref.read(
        AddToCardUpdateProvider(formData).future,
      );
      LoadingOverlay.forcedStop();
      if (result?.status == "true") {
        ShowToastMessage(result?.message ?? "");
        // ref.refresh(ProductDetailProvider(formData1));
      } else {
        ShowToastMessage(result?.message ?? "");
      }
    }
  }

  Future<void> _decrement(String VARIANT_ID) async {
    if (_counter != 0) {
      _counter--;

      if (_counter == 0) {
        LoadingOverlay.show(context);

        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": widget.categoryData.itemID,
              "CI_VARIANT_TYPE": VARIANT_ID,
              "CI_ITEM_QTY": "1"
            }
          ],
        };

        final result = await ref.read(AddToCardDeleteProvider(formData).future);

        LoadingOverlay.forcedStop();
        // Handle the result
        if (result?.status == true) {
          ShowToastMessage(result?.message ?? "");
          // ref.refresh(ProductDetailProvider(formData1));
          // Handle success
        } else {
          // Handle failure
          ShowToastMessage(result?.message ?? "");
        }
      } else {
        LoadingOverlay.show(context);
        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": widget.categoryData.itemID,
              "CI_VARIANT_TYPE": VARIANT_ID,
              "CI_ITEM_QTY": "${_counter}"
            }
          ],
        };

        final result = await ref.read(
          AddToCardUpdateProvider(formData).future,
        );
        LoadingOverlay.forcedStop();
        if (result?.status == "true") {
          ShowToastMessage(result?.message ?? "");
          // ref.refresh(ProductDetailProvider(formData1));
        } else {
          ShowToastMessage(result?.message ?? "");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalAmount = widget.categoryData.allVariant!
        .map((variant) =>
            int.parse(variant.itemQty ?? "") *
            int.parse(variant.sellingPrice ?? ""))
        .reduce((a, b) => a + b);

    return Scaffold(
        body: Container(
            height: (widget.categoryData.allVariant?.length ?? 0) * 100 + 100,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      widget.categoryData.item ?? "",
                      style: productNameT,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.categoryData.allVariant?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 10, left: 15, right: 15),
                        child: Container(
                          height: 70,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 0.5, color: grey1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              widget.categoryData.itemImage ??
                                                  ""))),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    "${widget.categoryData.allVariant?[index].variantName ?? ""} x ${widget.categoryData.allVariant?[index].itemQty ?? ""}",
                                    style: kgT,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  widget.categoryData.allVariant?[index]
                                          .sellingPrice ??
                                      "",
                                  style: kgT,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.categoryData.allVariant?[index]
                                          .actualPrice ??
                                      "",
                                  style: offerStrikeT,
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: green5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          int.parse(widget.categoryData
                                                  .allVariant?[index].itemQty ??
                                              "");
                                          _decrement(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .variantID ??
                                              "");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '-',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "${_counter}",
                                          //"${categoryData.allVariant?[index].itemQty ?? ""}",
                                          style: kgT,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _counter = int.parse(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .itemQty ??
                                              "");
                                          _increment(widget
                                                  .categoryData
                                                  .allVariant?[index]
                                                  .variantID ??
                                              "");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '+',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 30),
                    child: Container(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: green1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Text(
                              "Total Item Price:",
                              style: appTitle2,
                            ),
                            const Spacer(),
                            Text(
                              "₹ ${totalAmount}",
                              style: appTitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
