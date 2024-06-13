import 'package:application/application.dart';
import 'package:flutter/material.dart';

import '../common/page_section.dart';
import '../common/external_links_section.dart';
import '../common/page_decorator.dart';
import '../common/text_section.dart';
import '../internationalization/site_texts.dart';
import 'game_router_impl.dart';

/// The view for the game page.
class GamePage extends StatefulWidget {

  const GamePage({super.key, required this.game});

  final Game game;
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return GamePageState(game: game);
  }
}

/// The view state for the about page.
class GamePageState extends State<GamePage> {

  GamePageState({required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {

    final viewModel = GameViewModel(GameRouterImpl(), game);
    final siteTexts = SiteTexts.of(context);

    final theme = Theme.of(context);
    final featuresTitleStyle = theme.textTheme.headlineSmall;
    final featuresTextStyle = theme.textTheme.bodyLarge;
    final awardsTextStyle = theme.textTheme.bodyLarge;

    return PageDecorator(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 20,
            child: Image.asset(siteTexts.translate(game.bannerImage))
          ),
          const SizedBox(height: 40),
          TextSection(
            title: siteTexts.translate(game.name),
            text: siteTexts.translate(game.shortDescription)
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: siteTexts.get('game.stores'),
            externalLinks: game.stores,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: siteTexts.get('game.videos'),
            externalLinks: game.videos,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          PageSection(
            title: siteTexts.get('game.features'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var feature in game.features)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(siteTexts.translate(feature.title), style: featuresTitleStyle),
                      const SizedBox(height: 10),
                      Text(siteTexts.translate(feature.text), style: featuresTextStyle),
                    ],
                  )
              ],
            )
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: siteTexts.get('game.socialMedia'),
            externalLinks: game.socialMediaLinks,
            onLinkOpened: (externalLink) {
              viewModel.openSocialMediaLink(externalLink);
            }
          ),
          const SizedBox(height: 20),
          TextSection(
            title: siteTexts.get('game.alternativeName'),
            text: siteTexts.translate(game.alternativeName)
          ),
          const SizedBox(height: 20),
          TextSection(
            title: siteTexts.get('game.genre'),
            text: siteTexts.translate(game.genre)
          ),
          const SizedBox(height: 20),
          PageSection(
            title: siteTexts.get('game.awards'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var award in game.awards)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text('• $award', style: awardsTextStyle),
                    ],
                  )
              ],
            )
          ),
          const SizedBox(height: 20),
          TextSection(
            title: siteTexts.get('game.developedBy'),
            text: siteTexts.translate(game.developedBy)
          ),
          const SizedBox(height: 20),
          TextSection(
            title: siteTexts.get('game.publishedBy'),
            text: siteTexts.translate(game.publishedBy)
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: siteTexts.get('game.additionalLinks'),
            externalLinks: game.additionalLinks,
            onLinkOpened: (externalLink) {
              viewModel.openSocialMediaLink(externalLink);
            }
          ),
        ]
      )
    );
  }
}
