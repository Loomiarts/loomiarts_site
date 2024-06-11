import 'package:domain/domain.dart';

/// Base interface for the router of the game screen.
abstract interface class GameRouter {
  void navigateBack();
  void navigateToExternalLink(ExternalLink link);
}
