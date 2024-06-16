import 'package:flutter/material.dart';
import 'page_section.dart';

/// Widget for text sections to be place in a page, containing the title and the text itself.
base class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.title,
    required this.text
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final bodyStyle = theme.textTheme.bodyLarge;

    return PageSection(
      title: title,
      child: SelectableText(text, style: bodyStyle,)
    );
  }
}
