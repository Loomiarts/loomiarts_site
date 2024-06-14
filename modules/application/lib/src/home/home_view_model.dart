import 'package:domain/domain.dart';

import 'home_router.dart';
import '../common/common_view_model.dart';

class HomeViewModel extends CommonViewModel {

  final HomeRouter _router;
  final GameRepository _gameRepository;
  List<Game> games = [];

  HomeViewModel(this._router, this._gameRepository, super._i18nRepository);

  Future load() async {
    games = await _gameRepository.getGames();
  }

  void selectGame(Game game) {
    _router.navigateToGame(game);
  }

  void selectAbout() {
    _router.navigateToAbout();
  }
}
