import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/game/game_router_impl.dart';

import '../about/about_page.dart';
import '../game/game_page.dart';

/// Implementation for the home router interface.
class HomeRouterImpl implements HomeRouter {

  final NavigatorState _navigator;

  HomeRouterImpl(this._navigator);

  @override
  void navigateToAbout() {
    _navigator.push(
      MaterialPageRoute(builder: (context) => const AboutPage())
    );
  }

  @override
  void navigateToGame(Game game) {
    _navigator.push(
      MaterialPageRoute(builder: (context) => GameRouterImpl(context).createWidget(game: game))
    );
  }
}
