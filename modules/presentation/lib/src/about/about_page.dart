import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/infrastructure.dart';
import '../common/external_links_section.dart';
import '../common/page_decorator.dart';
import '../common/text_section.dart';
import 'about_router_impl.dart';

/// The view for the about page.
class AboutPage extends StatefulWidget {

  const AboutPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return AboutPageState();
  }
}

/// The view state for the about page.
class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {

    final viewModel = AboutViewModel(AboutRouterImpl(), AboutRepositoryImpl());
    viewModel.load();

    return PageDecorator(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset(
              'assets/loomiarts_logo_transparent.png',
              alignment: Alignment.centerLeft,
            )
          ),
          const SizedBox(height: 40),
          TextSection(
            title: 'Sobre',
            text: viewModel.about.text
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: 'Redes sociais',
            externalLinks: viewModel.about.socialMediaLinks,
            onLinkOpened: (externalLink) {
              viewModel.openSocialMediaLink(externalLink);
            }
          )
        ]
      ),
    );
  }
}
