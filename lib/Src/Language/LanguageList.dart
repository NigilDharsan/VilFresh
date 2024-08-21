import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vilfresh/main.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.select_language),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              _changeLanguage(context, Locale('en'));
            },
          ),
          ListTile(
            title: Text('தமிழ்'),
            onTap: () {
              _changeLanguage(context, Locale('ta'));
            },
          ),
          // Add more languages here
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale newLocale) {
    MyApp.setLocale(context, newLocale);
  }
}
