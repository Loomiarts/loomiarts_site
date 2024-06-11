import 'package:application/application.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutRouterImpl implements AboutRouter {

  @override
  void navigateBack() {
  }

  @override
  void navigateToSocialMediaLink(ExternalLink link) {
    launchUrlString(link.url, mode: LaunchMode.externalApplication);
  }
}
