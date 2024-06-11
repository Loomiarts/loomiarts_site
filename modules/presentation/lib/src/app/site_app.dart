import 'package:flutter/material.dart';
import '../home/home_page.dart';

/// Main app implementation.
class SiteApp extends StatelessWidget {
  const SiteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loomiarts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA20033)),
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}
