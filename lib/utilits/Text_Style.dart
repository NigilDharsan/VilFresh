import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Common_Colors.dart';


TextStyle LoginT=TextStyle( fontFamily: 'Roboto', fontSize: 24, color: Color.fromRGBO(52, 52, 52, 1), fontWeight: FontWeight.w700);
TextStyle appTitle=TextStyle( fontFamily: 'Roboto', fontSize: 18, color: green2, fontWeight: FontWeight.w700);
TextStyle appTitle2=TextStyle( fontFamily: 'Roboto', fontSize: 18, color: white1, fontWeight: FontWeight.w500);
TextStyle notificationTitle=TextStyle( fontFamily: 'Nunito', fontSize: 16, color: blue3, fontWeight: FontWeight.w700);
TextStyle ProuctT=TextStyle( fontFamily: 'Roboto', fontSize: 20, color: Color.fromRGBO(52, 52, 52, 1), fontWeight: FontWeight.w700);
TextStyle ProductPriceT=TextStyle( fontFamily: 'Roboto', fontSize: 18, color: Color.fromRGBO(52, 52, 52, 1), fontWeight: FontWeight.w500);
TextStyle phoneHT=TextStyle( fontFamily: 'Roboto', fontSize: 14, color: Color.fromRGBO(140, 140, 140, 1), fontWeight: FontWeight.w400);
TextStyle Textfield_Style=TextStyle( fontFamily: 'Inter', fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);
TextStyle TextField_Title=TextStyle( fontFamily: 'Montserrat', fontSize: 16, color: white1, fontWeight: FontWeight.w600);
TextStyle termsT=TextStyle( fontFamily: 'Montserrat', fontSize: 14, color: white1, fontWeight: FontWeight.w600);
TextStyle Textfield_Style2=TextStyle( fontFamily: 'Inter', fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600);
TextStyle contentT=TextStyle( fontFamily: 'Inter', fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500);
TextStyle StarT=TextStyle(color: Colors.red,fontSize: 25);

TextStyle ButtonT=GoogleFonts.openSans(textStyle: TextStyle(fontSize: 18, color:green1, fontWeight: FontWeight.w700));
TextStyle ButtonT1=GoogleFonts.openSans(textStyle: TextStyle(fontSize: 18, color:white1, fontWeight: FontWeight.w700));
TextStyle radioT=GoogleFonts.openSans(textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400));

//APP LOGIN TEXT
TextStyle appLoginT=TextStyle( fontFamily: 'Montserrat', fontSize: 30, color:green1, fontWeight: FontWeight.w700,letterSpacing: 1.8);
TextStyle appLoginT1=TextStyle( fontFamily: 'Montserrat', fontSize: 35, color:green1, fontWeight: FontWeight.w800,letterSpacing: 2.25);
TextStyle searchT=TextStyle( fontFamily: 'Montserrat', fontSize: 18, color:green1, fontWeight: FontWeight.w600,letterSpacing: 2.4);
//CREATE ACCOUNT
TextStyle createT=TextStyle( fontFamily: 'Montserrat', fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700);
//HOME DASHBOARD
TextStyle shopT=TextStyle( fontFamily: 'Montserrat', fontSize: 18, color: green1, fontWeight: FontWeight.w600,letterSpacing: 0.35);
TextStyle viewAllT=TextStyle( fontFamily: 'Montserrat', fontSize: 14, color: green1, fontWeight: FontWeight.w600,letterSpacing: 0.25);
TextStyle cardT=TextStyle( fontFamily: 'Montserrat', fontSize: 16, color:green1, fontWeight: FontWeight.w400,);
//MY ORDER
TextStyle orderNameT=TextStyle( fontFamily: 'Montserrat', fontSize: 24, color: green2, fontWeight: FontWeight.w700,letterSpacing: 2.5);
TextStyle qntT=TextStyle( fontFamily: 'Montserrat', fontSize: 20, color: green2, fontWeight: FontWeight.w600,letterSpacing: 2);
TextStyle orderPriceT=TextStyle( fontFamily: 'Montserrat', fontSize: 20, color: green2, fontWeight: FontWeight.w800,letterSpacing: 2);
//PRODUCT
TextStyle productNameT=TextStyle( fontFamily: 'Montserrat', fontSize: 20, color: green2, fontWeight: FontWeight.w700);
TextStyle kgT=TextStyle( fontFamily: 'Montserrat', fontSize: 16, color: green2, fontWeight: FontWeight.w600);
TextStyle productPrice=TextStyle( fontFamily: 'Montserrat', fontSize: 16, color: green2, fontWeight: FontWeight.w800);
TextStyle knowT=TextStyle( fontFamily: 'Montserrat', fontSize: 24, color: green2, fontWeight: FontWeight.w600);


//HEADING
Widget Title_Style({required String Title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15,bottom: 10),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          // width: 135,
          child: Text(
            Title,
            style: TextField_Title,
          ),
        ),
      ],
    ),
  );
}

Widget RadioText(String txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Text(
      txt,
      style: phoneHT,
    ),
  );
}






