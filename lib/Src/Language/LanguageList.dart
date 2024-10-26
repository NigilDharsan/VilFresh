import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vilfresh/main.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Select Language"), //AppLocalizations.of(context)!.select_language),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              _changeLanguage(context, const Locale('en'));
            },
          ),
          ListTile(
            title: const Text('தமிழ்'),
            onTap: () {
              _changeLanguage(context, const Locale('ta'));
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
