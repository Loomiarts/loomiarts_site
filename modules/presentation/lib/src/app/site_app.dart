import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../home/home_page.dart';
import '../internationalization/site_texts.dart';

/// Main app implementation.
class SiteApp extends StatefulWidget {

  const SiteApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SiteAppState();
  }
}

class _SiteAppState extends State<SiteApp> {

  Locale? _locale;

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
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
      home: const HomePage()
    );
  }
}
