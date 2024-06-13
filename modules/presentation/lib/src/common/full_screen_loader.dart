import 'package:flutter/material.dart';

/// Widget used for loading screens.
base class FullScreenLoader extends StatelessWidget {

  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }

}
