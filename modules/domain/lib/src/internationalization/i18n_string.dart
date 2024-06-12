/// Object that wraps a string with a base value and alternative localized values.
class I18nString {
  late final String base;
  final Map<String, String> localizedStrings;

  I18nString(this.base, {required this.localizedStrings});

  I18nString.base(this.base) : localizedStrings = {};

  /// Initializes from a Json map.
  I18nString.fromMap(Map<String, dynamic> map) : localizedStrings = {} {
    base = (map['base'] is String) ? map['base'] : '';
    for (var key in map.keys) {
      if (key != 'base' && map[key] is String) {
        localizedStrings[key] = map[key];
      }
    }
  }

  /// Returns a map with many pairs of key/I18nString, usually used to load a Json file with many
  /// localized string entries.
  static Map<String, I18nString> manyFromMap(Map<String, dynamic> map) {
    Map<String, I18nString> result = {};
    for (var key in map.keys) {
      if (map[key] is Map<String, dynamic>) {
        result[key] = I18nString.fromMap(map[key]);
      }
    }
    return result;
  }

  @override
  String toString({String? languageCode}) {
    if (languageCode != null) {
      return localizedStrings[languageCode] ?? base;
    } else {
      return base;
    }
  }
}
