import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:presentation/src/about/about_page.dart';

import 'home_router_impl.dart';
import 'home_tile.dart';

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
  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel(HomeRouterImpl(), GameRepositoryImpl());
    viewModel.load();
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (var game in viewModel.games) HomeTile(
                  title: "Jogo",
                  imageAsset: game.posterImage,
                  onTap: () {
                    print(game.name);
                  },
                ),
                HomeTile(
                  title: "Sobre",
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
