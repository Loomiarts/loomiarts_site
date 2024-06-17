import 'package:flutter/material.dart';
import 'package:application/application.dart';

import 'home_tile.dart';
import '../common/app_bar.dart' as site_app_bar;
import '../common/full_screen_loader.dart';
import '../internationalization/loc_strings.dart';

/// The view for the home page.
class HomePage extends StatefulWidget {

  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return HomePageState(viewModel);
  }
}

/// The view state for the home page.
class HomePageState extends State<HomePage> {

  Future? _loading;
  final HomeViewModel viewModel;

  HomePageState(this.viewModel);

  @override
  void initState() {
    super.initState();
    _loading = viewModel.load();
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
          return Scaffold(
            appBar: const site_app_bar.AppBar(),
            body: Center(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                shrinkWrap: true,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var game in viewModel.games) HomeTile(
                        title: siteTexts.get("home.game"),
                        imageAsset: siteTexts.translate(game.posterImage),
                        onTap: () {
                          viewModel.selectGame(game);
                        },
                      ),
                      HomeTile(
                        title: siteTexts.get("home.about"),
                        imageAsset: 'assets/loomiarts_logo.png',
                        onTap: () {
                          viewModel.selectAbout();
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
