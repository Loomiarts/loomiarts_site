import 'package:application/application.dart';
import 'package:flutter/widgets.dart';
import 'package:infrastructure/infrastructure.dart';

class LocStrings {

  static LocStrings of(BuildContext context) {
    return Localizations.of<LocStrings>(context, LocStrings) ?? LocStrings(const Locale('en'));
  }

  static const LocalizationsDelegate<LocStrings> delegate = _LocalizationsDelegate();

  final Locale _locale;

  LocStrings(this._locale);

  Future load() async {
    final repo = I18nRepositoryImpl.withoutContext();
    await repo.loadStrings();
  }

  String get(String key) {
    return (I18nRepositoryImpl.withoutContext().getAllStrings())[key]?.toString(languageCode: _locale.languageCode) ?? '';
  }

  String translate(LocString locString) {
    return locString.toString(languageCode: _locale.languageCode);
  }
}

class _LocalizationsDelegate extends LocalizationsDelegate<LocStrings> {

  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Language.values.map((e) => e.languageCode).contains(locale.languageCode);
  }

  @override
  Future<LocStrings> load(Locale locale) async {
    final locStrings = LocStrings(locale);
    await locStrings.load();
    return locStrings;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

}
