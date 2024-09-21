import 'dart:async';

import 'package:flutter/material.dart';

import 'Generic.dart';

class Landing extends StatefulWidget {
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
    await Future.delayed(Duration(seconds: 1));
    // FlutterNativeSplash.remove();
  }

  _loadUserInfo() async {
    final routesData = await getRoutes();
    routesData != null ? _isLoggedIn = routesData : _isLoggedIn = "false";
    if (_isLoggedIn == "true") {
      _startTimer();

      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _periodicFunction();
    });
  }

  void _periodicFunction() {
    // Your function logic here
    print('Function called at ${DateTime.now()}');
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
