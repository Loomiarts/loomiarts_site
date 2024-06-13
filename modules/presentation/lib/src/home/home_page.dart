import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:presentation/src/about/about_page.dart';
import 'package:presentation/src/game/game_page.dart';

import 'home_router_impl.dart';
import 'home_tile.dart';
import '../common/full_screen_loader.dart';
import '../internationalization/site_texts.dart';

/// The view for the home page.
class HomePage extends StatefulWidget {

  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

/// The view state for the home page.
class HomePageState extends State<HomePage> {

  Future? _loading;
  HomeViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(HomeRouterImpl(), GameRepositoryImpl());
    _loading = _viewModel?.load();
  }

  @override
  Widget build(BuildContext context) {
    
    final siteTexts = SiteTexts.of(context);

    return FutureBuilder(
      future: _loading,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FullScreenLoader();
        } else {
          return Scaffold(
            body: Center(
              child: ListView(
                padding: const EdgeInsets.all(40.0),
                shrinkWrap: true,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var game in _viewModel!.games) HomeTile(
                        title: siteTexts.get("home.game"),
                        imageAsset: siteTexts.translate(game.posterImage),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => GamePage(game: game))
                          );
                        },
                      ),
                      HomeTile(
                        title: siteTexts.get("home.about"),
                        imageAsset: 'assets/loomiarts_logo.png',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const AboutPage())
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
  
}
