import 'package:domain/domain.dart';

import 'about_router.dart';
import '../common/common_view_model.dart';

class AboutViewModel extends CommonViewModel {

  final AboutRouter _router;
  final AboutRepository _aboutRepository;
  About about = About();

  AboutViewModel(this._router, this._aboutRepository, super._i18nRepository);

  Future load() async {
    about = await _aboutRepository.getAbout();
  }

  void navigateBack() {
    _router.navigateBack();
  }

  void openSocialMediaLink(ExternalLink link) {
    _router.navigateToSocialMediaLink(link);
  }
}
