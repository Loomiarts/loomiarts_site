import 'i18n_string.dart';

/// Base interface for the repository for the internationalized texts.
abstract interface class I18nRepository {
  Future<void> loadStrings();
  Map<String, I18nString> getAll();
}
