import "game.dart";

/// Game repository interface.
abstract interface class GameRepository {
  List<Game> getGames();
}
