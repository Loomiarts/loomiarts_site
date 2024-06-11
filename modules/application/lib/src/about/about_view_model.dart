import 'package:domain/domain.dart';
import 'about_router.dart';

class AboutViewModel {

  final AboutRouter _router;
  final AboutRepository _aboutRepository;
  About about = About();

  AboutViewModel(this._router, this._aboutRepository);

  void load() {
    about = _aboutRepository.getAbout();
  }

  void navigateBack() {
    _router.navigateBack();
  }

  void openSocialMediaLink(ExternalLink link) {
    
  }
}
