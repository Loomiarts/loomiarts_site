import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:infrastructure/infrastructure.dart';

import 'game_page.dart';

class GameRouterImpl implements GameRouter {

  BuildContext _context;

  GameRouterImpl(this._context);

  Widget createWidget({required Game game}) {
    final viewModel = GameViewModel(this, game, I18nRepositoryImpl(_context));
    return GamePage(viewModel: viewModel);
  }

  @override
  void navigateToExternalLink(ExternalLink link) {
    launchUrlString(link.url, mode: LaunchMode.externalApplication);
  }
}
