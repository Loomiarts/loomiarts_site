import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/page_section.dart';
import '../common/external_links_section.dart';
import '../common/page_decorator.dart';
import '../common/text_section.dart';
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
            child: Image.asset(game.bannerImage)
          ),
          const SizedBox(height: 40),
          TextSection(
            title: game.name,
            text: game.shortDescription
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: 'Lojas',
            externalLinks: game.stores,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: 'Vídeos',
            externalLinks: game.videos,
            onLinkOpened: (externalLink) {
              viewModel.openStore(externalLink);
            }
          ),
          const SizedBox(height: 20),
          PageSection(
            title: 'Características',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var feature in game.features)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(feature.title, style: featuresTitleStyle),
                      const SizedBox(height: 10),
                      Text(feature.text, style: featuresTextStyle),
                    ],
                  )
              ],
            )
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: 'Redes sociais',
            externalLinks: game.socialMediaLinks,
            onLinkOpened: (externalLink) {
              viewModel.openSocialMediaLink(externalLink);
            }
          ),
          const SizedBox(height: 20),
          TextSection(
            title: 'Nome internacional',
            text: game.internationalName
          ),
          const SizedBox(height: 20),
          TextSection(
            title: 'Gênero',
            text: game.genre
          ),
          const SizedBox(height: 20),
          PageSection(
            title: 'Prêmios',
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
            title: 'Desenvolvido por',
            text: game.developedBy
          ),
          const SizedBox(height: 20),
          TextSection(
            title: 'Publicado por',
            text: game.publishedBy
          ),
          const SizedBox(height: 20),
          ExternalLinksSection(
            title: 'Links adicionais',
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
