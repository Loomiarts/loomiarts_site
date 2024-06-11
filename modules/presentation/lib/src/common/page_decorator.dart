import 'package:flutter/material.dart';

/// The widget that wraps most of the pages.
class PageDecorator extends StatelessWidget {
  const PageDecorator({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(40.0),
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1000.0),
                child: child,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
