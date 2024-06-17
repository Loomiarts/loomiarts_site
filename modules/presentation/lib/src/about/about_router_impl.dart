import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'about_page.dart';

class AboutRouterImpl implements AboutRouter {

  final BuildContext _context;

  AboutRouterImpl(this._context);

  Widget createWidget() {
    final viewModel = AboutViewModel(this, AboutRepositoryImpl(), I18nRepositoryImpl(_context));
    return AboutPage(viewModel: viewModel);
  }

  @override
  void navigateToSocialMediaLink(ExternalLink link) {
    launchUrlString(link.url, mode: LaunchMode.externalApplication);
  }
}
