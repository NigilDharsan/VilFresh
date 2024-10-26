import 'package:flutter/material.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../utilits/Common_Colors.dart';
import 'Image_Path.dart';

// ELEVATED BUTTON
Widget CommonElevatedButton(
  BuildContext context,
  String titleName,
  void Function()? onPress,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: white1,
      minimumSize: const Size(double.infinity, 50),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT,
    ),
  );
}

// GREEN ELEVATED BUTTON
Widget CommonElevatedButtonGreen(
  BuildContext context,
  String titleName,
  void Function()? onPress,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: green2,
      minimumSize: const Size(double.infinity, 50),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT1,
    ),
  );
}

// YELLOW ELEVATED BUTTON
Widget CommonElevatedButtonYelow(
  BuildContext context,
  String titleName,
  void Function()? onPress,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: yellow1,
      minimumSize: const Size(double.infinity, 50),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT2,
    ),
  );
}

//CALL NOW BOTTON
Widget callNow_Button(BuildContext context, String titleName,
    {required void Function()? onPress, required Color? backgroundColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: const Size(double.infinity, 30),
      // elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT1,
    ),
  );
}

//CHAT BUTTON
Widget Chat_Button(
  BuildContext context,
  void Function()? onPress,
) {
  return InkWell(
    onTap: onPress,
    child: Container(
        height: 35,
        width: 35,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: blue3),
        child: Center(child: ImgPathSvg('Send.svg'))),
  );
}

//RADIO BUTTON
Widget RadioButton(
    {required int? groupValue1,
    required int? groupValue2,
    required void Function(int?)? onChanged1,
    required void Function(int?)? onChanged2,
    required String radioTxt1,
    required String radioTxt2}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white1),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 50),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: groupValue1,
                activeColor: orange1,
                onChanged: onChanged1,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              RadioText(radioTxt1),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white1),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 50),
          child: Row(
            children: [
              Radio(
                value: 1,
                groupValue: groupValue2,
                activeColor: orange1,
                onChanged: onChanged2,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              RadioText(radioTxt2),
            ],
          ),
        ),
      )
    ],
  );
}

// CHECK BOX
Widget CheckBoxes(
    {required bool? value,
    required void Function(bool?)? onChanged,
    required String checkBoxText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Checkbox(
        value: value,
        activeColor: orange1,
        onChanged: onChanged,
        checkColor: orange2,
        hoverColor: orange2,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      RadioText(checkBoxText),
    ],
  );
}

//CUSTOM BUTTON
Widget Custom_Button(context,
    {required String customTxt, required void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: green5,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
            child: Text(
          customTxt,
          style: ButtonT,
        )),
      ),
    ),
  );
}

//DROPDOWN

Widget dropDownFieldprofileedit(
  context, {
  required dynamic width,
  required String? value,
  required List<String>? listValue,
  required void Function(String?)? onChanged,
  required String hintT,
}) {
  return SizedBox(
    height: 35,
    width: width,
    child: DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintT,
        helperStyle: SubT2,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
      ),
      items: listValue?.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Center(
              child: Text(
            option,
            style: SubT2,
          )),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}
