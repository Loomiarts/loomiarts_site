import 'package:domain/domain.dart';

/// Base interface for the router of the about screen.
abstract interface class AboutRouter {
  void navigateBack();
  void navigateToSocialMediaLink(ExternalLink link);
}
