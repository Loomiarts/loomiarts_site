import 'package:application/application.dart';
import 'package:flutter/material.dart';

import '../common/page_section.dart';
import '../common/external_links_section.dart';
import '../common/page_decorator.dart';
import '../common/text_section.dart';
import '../internationalization/loc_strings.dart';

/// The view for the game page.
class GamePage extends StatefulWidget {

  final GameViewModel viewModel;

  const GamePage({super.key, required this.viewModel});
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return GamePageState(viewModel);
  }
}

/// The view state for the about page.
class GamePageState extends State<GamePage> {

  final GameViewModel viewModel;

  GamePageState(this.viewModel);

  @override
  Widget build(BuildContext context) {

    final game = viewModel.game;

    final locStrings = LocStrings.of(context);

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
            child: Image.asset(locStrings.translate(game.bannerImage))
          ),
          const SizedBox(height: 40),
          TextSection(
            title: locStrings.translate(game.name),
            text: locStrings.translate(game.shortDescription)
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: locStrings.get('game.stores'),
            externalLinks: game.stores,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: locStrings.get('game.videos'),
            externalLinks: game.videos,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          PageSection(
            title: locStrings.get('game.features'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var feature in game.features)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(locStrings.translate(feature.title), style: featuresTitleStyle),
                      const SizedBox(height: 10),
                      Text(locStrings.translate(feature.text), style: featuresTextStyle),
                    ],
                  )
              ],
            )
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: locStrings.get('game.socialMedia'),
            externalLinks: game.socialMediaLinks,
            onLinkOpened: (externalLink) {
              viewModel.openSocialMediaLink(externalLink);
            }
          ),
          const SizedBox(height: 20),
          TextSection(
            title: locStrings.get('game.alternativeName'),
            text: locStrings.translate(game.alternativeName)
          ),
          const SizedBox(height: 20),
          TextSection(
            title: locStrings.get('game.genre'),
            text: locStrings.translate(game.genre)
          ),
          const SizedBox(height: 20),
          PageSection(
            title: locStrings.get('game.awards'),
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
            title: locStrings.get('game.developedBy'),
            text: locStrings.translate(game.developedBy)
          ),
          const SizedBox(height: 20),
          TextSection(
            title: locStrings.get('game.publishedBy'),
            text: locStrings.translate(game.publishedBy)
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: locStrings.get('game.additionalLinks'),
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
