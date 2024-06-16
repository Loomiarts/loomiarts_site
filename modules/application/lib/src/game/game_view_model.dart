import 'package:domain/domain.dart';

import 'game_router.dart';
import '../common/common_view_model.dart';

/// View model for the game page.
class GameViewModel extends CommonViewModel {

  final GameRouter _router;
  final Game game;

  GameViewModel(this._router, this.game, super._i18nRepository);

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
