import 'loc_string.dart';
import 'language.dart';

/// Base interface for the repository for the internationalized texts.
abstract interface class I18nRepository {
  Future<void> loadStrings();
  Map<String, LocString> getAllStrings();
  Language get currentLanguage;
  set currentLanguage(Language newCurrentLanguage);
}
