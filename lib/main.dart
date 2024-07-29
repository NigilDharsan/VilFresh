import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/utilits/Landing.dart';

import 'Src/Login_Ui/Login_Screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        "/": (context) => Landing(),
        "/login": (context) => Login_Screen(),
        "/home": (context) =>
            Login_Screen() //Bottom_Navigation_Bar(select: 0,),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (value) {
        return MaterialPageRoute(builder: (context) => Login_Screen());
      },
      // home: Login_Screen(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
