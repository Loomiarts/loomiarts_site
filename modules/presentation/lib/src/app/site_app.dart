import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../home/home_page.dart';
import '../internationalization/site_texts.dart';

/// Main app implementation.
class SiteApp extends StatefulWidget {

  const SiteApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return SiteAppState();
  }
}

class SiteAppState extends State<SiteApp> implements I18nDelegate<SiteApp> {

  Locale? _locale;

  @override
  set language(Language newLanguage) {
    setState(() {
      _locale = Locale(newLanguage.languageCode);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loomiarts',
      locale: _locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA20033)),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        SiteTexts.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Language.values.map((e) => Locale(e.languageCode)),
      home: const HomePage()
    );
  }
}
