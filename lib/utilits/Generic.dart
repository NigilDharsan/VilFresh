import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';

import 'Common_Colors.dart';

String accesstokens = 'accessToken';
String user_Id = 'user_id';
String Storage = 'storage';
String routes = "routes_Log";
String address = 'address';

String addressID = 'addressID';
String addressName = 'addressName';

accessToken(dynamic val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(accesstokens, val);
}

Future<dynamic> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final gettoken = prefs.getString(accesstokens);
  return gettoken!;
}

UserId(dynamic val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(user_Id, val);
}

Future<dynamic> getuserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString(user_Id);
  return userId;
}

Routes(dynamic val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(routes, val);
}

Future<dynamic> getRoutes() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final routesLog = prefs.getString(routes);
  return routesLog;
}

Future<void> storeUserInformation(LoginData user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', jsonEncode(user.toJson()));
  // await prefs.setString('tokenID', user.tokenID);
}

Future<LoginData?> getUserInformation() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString('user');
  if (userJson != null) {
    return LoginData.fromJson(jsonDecode(userJson));
  }
  return null;
}

Future<void> storeAddressID(String addressId) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(addressID, addressId);
}

Future<void> storeAddressName(String address) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(addressName, address);
}

Future<String> getAddressID() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? addressId = prefs.getString(addressID);
  return addressId ?? "";
}

Future<String> getAddressName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? address = prefs.getString(addressName);
  return address ?? "";
}

Future<void> storeCouponID(
    String coupenCode, String coupenID, String rate) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('coupenID', coupenID);
  await prefs.setString('coupenCode', coupenCode);
  await prefs.setString('rate', rate);
}

Future<List<String?>> getCouponID() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? couponID = prefs.getString('couponId');
  final String? coupenCode = prefs.getString('coupenCode');
  final String? rate = prefs.getString('rate');

  return [couponID ?? "", coupenCode ?? "", rate ?? ""];
}

Future<void> setLanguage(String language) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('language', language);
}

Future<String?> getlanguage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? language = prefs.getString('language');

  return language ?? "en";
}

addressAdded(dynamic val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(address, val);
}

Future<dynamic> isAddressAdded() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final isAddress = prefs.getBool(address);
  return isAddress;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

void ShowToastMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: green1,
    textColor: Colors.white,
    fontSize: 16.0);
void MotionToastErr(String message) {
  MotionToast.error(
    description: Text(message),
    height: 60,
    width: 280,
  ).show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastErrwithoutTitle(String message) {
  MotionToast.error(
    description: Text(message),
    height: 60,
    width: 280,
  ).show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastErrwithTitle(String title, String message) {
  MotionToast.error(
    title: Text(title),
    description: Text(message),
    height: 60,
    width: 280,
  ).show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastSuccess(String message) {
  MotionToast.success(description: Text(message), height: 60, width: 280)
      .show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastSuccessDuration(String message, int duration) {
  MotionToast.success(
    description: Text(message),
    height: 60,
    width: 280,
    toastDuration: Duration(seconds: duration),
  ).show(NavigationService.navigatorKey.currentContext!);
}

void MotionToastCustom(String message) {
  MotionToast(
    icon: Icons.alarm,
    primaryColor: Colors.pink,
    title: Text(message),
    description: const Text(""),
    width: 300,
    height: 100,
  ).show(NavigationService.navigatorKey.currentContext!);
}

class GetterSetter {
  String? _myValue;

  String get myValue {
    return _myValue ?? "";
  }

  set myValue(String value) {
    _myValue = value;
  }
}

class SingleTon {
  static final SingleTon qwerty = SingleTon._internal();
  factory SingleTon() {
    return qwerty;
  }
  SingleTon._internal();
  String full_Name = "";
  String categories_id = "";
  String user_id = "";
  String address_id = "";
  String address_name = "";

  double walletBalance = 0.0;

  String setLocation = "";
  String lattidue = "";
  String longitude = "";

  bool isLoading = true;
  bool justLogged = false;

  // LatLng locationLat = LatLng(0.0, 0.0);
}

Widget buildLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: SpinKitWave(
        type: SpinKitWaveType.center,
        size: 50,
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? blue3 : Colors.black,
            ),
          );
        },
      ),
    ),
  );
}

// Future<void> readall() async{
// final all =await _secureStorage.readAll(aOptions: _androidOptions());
// }

// void tokenVal(tokens, farmerId) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString("tokenval", tokens);
//   await prefs.setInt("farmerID", farmerId);
//   final _tokenval = await prefs.getString("tokenval");
//   final _idVal = await prefs.getInt("farmerID");
//   print(_tokenval);
//   print(_idVal);
// }


