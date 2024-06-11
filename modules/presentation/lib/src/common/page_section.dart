import 'package:flutter/material.dart';

/// Base widget for page sections (title and a content).
class PageSection extends StatelessWidget {
  const PageSection({
    super.key,
    required this.title,
    required this.child
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final titlesStyle = theme.textTheme.headlineLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titlesStyle),
        const SizedBox(height: 15),
        child
      ],
    );
  }
}
