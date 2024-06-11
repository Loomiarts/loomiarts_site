import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/infrastructure.dart';
import '../common/text_section.dart';
import '../common/external_links_section.dart';
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

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000.0),
            child: ListView(
              children: [
                TextSection(
                  title: game.name,
                  text: game.name
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
                ExternalLinksSection(
                  title: 'Redes sociais',
                  externalLinks: game.socialMediaLinks,
                  onLinkOpened: (externalLink) {
                    viewModel.openSocialMediaLink(externalLink);
                  }
                )
              ]
            ),
          ),
        )
      ),
    );
  }
  
}
