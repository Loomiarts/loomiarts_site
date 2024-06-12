import 'package:domain/domain.dart';
import 'about_router.dart';

class AboutViewModel {

  final AboutRouter _router;
  final AboutRepository _aboutRepository;
  About about = About();

  AboutViewModel(this._router, this._aboutRepository);

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
