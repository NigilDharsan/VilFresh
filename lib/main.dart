import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Landing.dart';

import 'Src/Login_Ui/Login_Screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      setLanguage(locale.languageCode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLangauage();
  }

  getLangauage() async {
    final getLang = await getlanguage() as String;
    setState(() {
      _locale = Locale(getLang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        "/": (context) => Landing(),
        "/login": (context) => Login_Screen(),
        "/home": (context) => Bottom_Navigation_Bar(
              select: 0,
            ),
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

  // This widget is the root of your application.
  

