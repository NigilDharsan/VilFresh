import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

// PNG IMAGE PATH
Widget ImgPathPng(String pathPNG) {
  return Image(image: AssetImage("lib/assets/$pathPNG"));
}

// SVG IMAGE PATH

Widget ImgPathSvg(String pathSVG) {
  return SvgPicture.asset("lib/assets/$pathSVG");
}

// Logo Image
Widget LoginScreenImage() {
  return ImgPathSvg("LoginscreenImg.svg");
}

Widget Logo() {
  return ImgPathSvg("logo.svg");
}

//CANDIDATE IMAGE

Widget Candidate_Img({required String ImgPath}) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: AssetImage("lib/assets/$ImgPath"), fit: BoxFit.cover)),
  );
}

//NODATA IMAGE
Widget noDataImg() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ImgPathSvg('nodataImg.svg'),
      const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Oops! No Data Available",
        ),
      ),
    ],
  );
}

//WALLET
Widget WalletCount() {
  return Container(
    height: 50,
    width: 50,
    margin: const EdgeInsets.only(right: 15),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child:
              SizedBox(height: 35, width: 35, child: ImgPathSvg("wallet.svg")),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: red1),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Text(
                '₹ 0',
                style: appWallet,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
