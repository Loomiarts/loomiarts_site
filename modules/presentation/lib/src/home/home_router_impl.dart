import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:flutter/material.dart';

import '../about/about_router_impl.dart';
import '../game/game_router_impl.dart';
import 'home_page.dart';

/// Implementation for the home router interface.
class HomeRouterImpl implements HomeRouter {

  final BuildContext _context;

  HomeRouterImpl(this._context);

  Widget createWidget() {
    final viewModel = HomeViewModel(this, GameRepositoryImpl(), I18nRepositoryImpl(_context));
    return HomePage(viewModel: viewModel);
  }

  @override
  void navigateToAbout() {
    Navigator.of(_context).push(
      MaterialPageRoute(builder: (context) => AboutRouterImpl(_context).createWidget())
    );
  }

  @override
  void navigateToGame(Game game) {
    Navigator.of(_context).push(
      MaterialPageRoute(builder: (context) => GameRouterImpl(_context).createWidget(game: game))
    );
  }
}
