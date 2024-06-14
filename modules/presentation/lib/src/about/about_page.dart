import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/infrastructure.dart';

import '../common/external_links_section.dart';
import '../common/full_screen_loader.dart';
import '../common/page_decorator.dart';
import '../common/text_section.dart';
import '../internationalization/loc_strings.dart';
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

  Future? _loading;
  AboutViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AboutViewModel(AboutRouterImpl(), AboutRepositoryImpl(), I18nRepositoryImpl());
    _loading = _viewModel?.load();
  }

  @override
  Widget build(BuildContext context) {
    final siteTexts = LocStrings.of(context);

    return FutureBuilder(
      future: _loading,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FullScreenLoader();
        } else {
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
                  title: siteTexts.get('about.title'),
                  text: siteTexts.translate(_viewModel!.about.text)
                ),
                const SizedBox(height: 20),
                ExternalLinksSection(
                  title: siteTexts.get('about.socialMediaAndOtherLinks'),
                  externalLinks: _viewModel!.about.socialMediaLinks,
                  onLinkOpened: (externalLink) {
                    _viewModel!.openSocialMediaLink(externalLink);
                  }
                ),
                const SizedBox(height: 20),
                TextSection(
                  title: siteTexts.get('about.contact'),
                  text: siteTexts.translate(_viewModel!.about.email)
                ),
              ]
            ),
          );
        }
      }
    );
  }
}
