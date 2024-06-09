import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'home_router_impl.dart';
import 'home_tile.dart';

/// The view for the home page.
class HomeView extends StatefulWidget {

  const HomeView({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
  
}

/// The view state for the home page.
class HomeViewState extends State<HomeView> {
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
              children: [
                for (var game in viewModel.games) HomeTile(
                  title: "Jogo",
                  imageAsset: game.posterImage
                ),
                const HomeTile(
                  title: "Sobre",
                  imageAsset: 'assets/loomiarts_logo.png'
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}
