import 'package:application/application.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GameRouterImpl implements GameRouter {

  @override
  void navigateToExternalLink(ExternalLink link) {
    launchUrlString(link.url, mode: LaunchMode.externalApplication);
  }
}
