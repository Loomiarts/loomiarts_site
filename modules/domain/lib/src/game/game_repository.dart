import "game.dart";

/// Game repository interface.
abstract interface class GameRepository {
  Future<List<Game>> getGames();
}
