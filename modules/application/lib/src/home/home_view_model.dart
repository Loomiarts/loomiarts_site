import 'package:domain/domain.dart';
import 'home_router.dart';

class HomeViewModel {

  final HomeRouter _router;
  final GameRepository _gameRepository;
  List<Game> games = [];

  HomeViewModel(this._router, this._gameRepository);

  void load() {
    games = _gameRepository.getGames();
  }

  void selectGame(Game game) {
    _router.navigateToGame(game);
  }

  void selectAbout() {
    _router.navigateToAbout();
  }
}
