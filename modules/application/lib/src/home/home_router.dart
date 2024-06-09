import 'package:domain/domain.dart';

/// Base interface for the router of the home screen.
abstract interface class HomeRouter {
  void navigateToGame(Game game);
  void navigateToAbout();
}
