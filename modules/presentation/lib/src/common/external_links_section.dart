import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'page_section.dart';

/// Widget for external links sections, containing a title and a list of buttons.
base class ExternalLinksSection extends StatelessWidget {
  const ExternalLinksSection({
    super.key,
    required this.title,
    required this.externalLinks,
    required this.onLinkOpened
  });

  final String title;
  final List<ExternalLink> externalLinks;
  final void Function(ExternalLink) onLinkOpened;

  @override
  Widget build(BuildContext context) {

    return PageSection(
      title: title,
      child: Wrap(
      spacing: 8,
        children: [
          for (var socialMediaLink in externalLinks)
            ElevatedButton(
              onPressed: () {
                onLinkOpened(socialMediaLink);
              },
              child: Text(socialMediaLink.name)
            )
        ],
      )
    );
  }
}
