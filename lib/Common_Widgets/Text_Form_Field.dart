import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vilfresh/Model/CityModel.dart';

import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';

//TEXTFORM FIELD

Widget textFormField(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    bool? isEnabled,
    void Function(String)? onChanged,
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    required TextInputType keyboardtype}) {
  return Container(
    // height: 50,
    child: TextFormField(
      enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
      style: Textfield_Style,
      keyboardType: keyboardtype,
    ),
  );
}

Widget textFormField_green(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    bool? isEnabled,
    void Function(String)? onChanged,
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    required TextInputType keyboardtype}) {
  return Container(
    // height: 50,
    child: TextFormField(
      enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
      keyboardType: keyboardtype,
    ),
  );
}

//white
Widget textFormField2(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    bool? isEnabled,
    void Function(String)? onChanged,
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    required TextInputType keyboardtype}) {
  return Container(
    // height: 50,
    child: TextFormField(
      enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        fillColor: white1,
        filled: true,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
      keyboardType: keyboardtype,
    ),
  );
}

Widget textFormField3(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    bool? isEnabled,
    void Function(String)? onChanged,
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    required TextInputType keyboardtype}) {
  return Container(
    // height: 50,
    child: TextFormField(
      enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        fillColor: white1,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            Controller?.clear();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
      keyboardType: keyboardtype,
    ),
  );
}

//TEXTFIELD DATE PICKER
Widget TextFieldDatePicker(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    void Function(String)? onChanged,
    required String hintText,
    void Function()? onTap}) {
  return TextFormField(
    controller: Controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onTap: onTap,
    readOnly: true,
    keyboardType: TextInputType.number,
    maxLength: 15,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: white1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: white1),
      ),
      counterText: "",
      hintText: 'DD / MM / YYYY',
      helperStyle: phoneHT,
      prefixIcon: const Icon(
        Icons.calendar_month,
        color: grey1,
        size: 24,
      ),
      hintStyle: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
        color: Colors.grey,
      ),
      errorMaxLines: 1,
      contentPadding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      fillColor: white1,
      filled: true,
    ),
    validator: validating,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    style: const TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Colors.black,
    ),
  );
}

// TEXT FIELD PASSWORD
Widget textFieldPassword(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    void Function(String)? onChanged,
    required bool obscure,
    required void Function()? onPressed,
    required String hintText,
    required TextInputType keyboardtype}) {
  return Container(
    // height: 50,
    child: TextFormField(
      controller: Controller,
      obscureText: obscure,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white2),
            borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.lock : Icons.lock_open,
            color: white1,
          ),
          onPressed: onPressed,
        ),
        fillColor: white2,
        filled: true,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardtype,
      style: Textfield_Style,
    ),
  );
}

//DESCRIPTION
Widget textfieldDescription(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    required String hintText}) {
  return Container(
    // height: 50,
    child: TextFormField(
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      maxLines: 5,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: green1),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: white1,
        filled: true,
      ),
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
    ),
  );
}

//SEARCH BAR
Widget textFormFieldSearchBar({
  TextEditingController? Controller,
  String? Function(String?)? validating,
  bool? isEnabled,
  void Function(String)? onChanged,
  required String hintText,
  List<TextInputFormatter>? inputFormatters,
  required TextInputType keyboardtype,
  required void Function()? onTap,
}) {
  return Container(
    // height: 50,
    child: TextFormField(
      onTap: onTap,
      enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: white2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: white2),
        ),
        fillColor: white1,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          size: 24,
          color: grey2,
        ),
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
      keyboardType: keyboardtype,
    ),
  );
}

Widget buildCompanyInfoRow(String pathPNG, String companyName,
    TextStyle textStyle, double imageWidth, double imageHeight) {
  return Container(
    child: Row(
      children: [
        Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage("lib/assets/$pathPNG"), fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: Text(
              companyName,
              style: textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget collegeRowTitle(String pathPNG, String companyName, TextStyle textStyle,
    double imageWidth, double imageHeight) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          height: imageHeight,
          width: imageWidth,
          child: Image(
            image: AssetImage("lib/assets/$pathPNG"),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: Text(
              companyName,
              style: textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

//DropDownExperience
Widget dropDownField(context,
    {required String? value,
    required List<String>? listValue,
    required void Function(String?)? onChanged,
    required String? hintT}) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: white1),
    child: DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      hint: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          hintT.toString(),
          style: phoneHT,
        ),
      ),
      decoration: const InputDecoration(border: InputBorder.none),
      icon: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.arrow_drop_down,
          color: green1,
          size: 35,
        ),
      ),
      items: listValue?.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(option),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}

//CITY
Widget cityDropDownField(context,
    {required FocusNode? focus,
    required List<Cities> listValue,
    required String? Function(String?)? validator,
    required void Function(String?)? searchText,
    required void Function(SearchFieldListItem<Cities> x)? onChanged,
    required String hintT}) {
  return SearchField(
    focusNode: focus,
    suggestionDirection: SuggestionDirection.down,
    suggestions: listValue
        .map((e) => SearchFieldListItem<Cities>(e.cityName ?? ""))
        .toList(),
    suggestionState: Suggestion.expand,
    suggestionsDecoration:
        SuggestionDecoration(padding: const EdgeInsets.all(10)),
    textInputAction: TextInputAction.next,
    searchStyle: Textfield_Style,
    validator: validator,
    searchInputDecoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      hintText: hintT,
      hintStyle: phoneHT,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: pink1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: pink1),
      ),
      fillColor: white2,
      filled: true,
    ),
    maxSuggestionsInViewPort: 5,
    itemHeight: 40,
    onSuggestionTap: onChanged,
    onSubmit: searchText,
  );
}
