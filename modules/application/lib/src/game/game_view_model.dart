import 'package:domain/domain.dart';
import 'game_router.dart';

/// View model for the game page.
class GameViewModel {

  final GameRouter _router;
  final Game game;

  GameViewModel(this._router, this.game);

  void navigateBack() {
    _router.navigateBack();
  }

  void openSocialMediaLink(ExternalLink link) {
    _router.navigateToExternalLink(link);
  }

  void openStore(ExternalLink link) {
    _router.navigateToExternalLink(link);
  }

  void openVideo(ExternalLink link) {
    _router.navigateToExternalLink(link);
  }

  void openAdditionalLink(ExternalLink link) {
    _router.navigateToExternalLink(link);
  }
}
