import 'package:flutter/widgets.dart';
import 'package:infrastructure/infrastructure.dart';

class SiteTexts {

  static SiteTexts of(BuildContext context) {
    return Localizations.of<SiteTexts>(context, SiteTexts) ?? SiteTexts(const Locale('en'));
  }

  static const LocalizationsDelegate<SiteTexts> delegate = _LocalizationsDelegate();

  final Locale _locale;

  SiteTexts(this._locale);

  Future load() async {
    final repo = I18nRepositoryImpl();
    await repo.loadStrings();
  }

  String get(String key) {
    return (I18nRepositoryImpl().getAll())[key]?.toString(languageCode: _locale.languageCode) ?? '';
  }
}

class _LocalizationsDelegate extends LocalizationsDelegate<SiteTexts> {

  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    if (locale.languageCode case 'pt' || 'en') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<SiteTexts> load(Locale locale) async {
    final siteTexts = SiteTexts(locale);
    await siteTexts.load();
    return siteTexts;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

}