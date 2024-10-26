import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';

import 'Generic.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _isLoggedIn = "false";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    initialize();
    _loadUserInfo();
  }

  void initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    // FlutterNativeSplash.remove();
  }

  _loadUserInfo() async {
    final routesData = await getRoutes();
    routesData != null ? _isLoggedIn = routesData : _isLoggedIn = "false";
    if (_isLoggedIn == "true") {
      _callApi();
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    }
  }

  Future<void> _callApi() async {
    LoginData? user = await getUserInformation();
    String? accesstoken = await getToken();

    SingleTon().address_id = await getAddressID();
    SingleTon().address_name = await getAddressName();

    SingleTon().user_id = user?.userId ?? "";

    var headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    var body =
        jsonEncode({'User_ID': user?.userId ?? "", 'Old_Token': accesstoken});
    try {
      var response = await http.post(Uri.parse(ConstantApi.refreshTokenUrl),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        print('API Call Success: ${response.body}');
        accessToken(jsonResponse['Refresh_Token']);
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', ModalRoute.withName('/home'));
      } else {
        print('API Call Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
