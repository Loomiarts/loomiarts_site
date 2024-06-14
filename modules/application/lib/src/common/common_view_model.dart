import 'package:domain/domain.dart';

/// Base class for view models with common data and behaviors.
class CommonViewModel {

  final I18nRepository _i18nRepository;

  final List<Language>languages = Language.values;

  Language get language {
    return _i18nRepository.currentLanguage;
  }

  set language(Language newLanguage) {
    _i18nRepository.currentLanguage = newLanguage;
  }

  CommonViewModel(this._i18nRepository);
}
