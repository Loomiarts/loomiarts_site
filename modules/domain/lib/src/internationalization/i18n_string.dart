/// Object that wraps a string with a base value and alternative localized values.
class I18nString {
  late final String base;
  final Map<String, String> localizedStrings;

  I18nString(this.base, {required this.localizedStrings});

  I18nString.base(this.base) : localizedStrings = {};

  /// Initializes from a Json map.
  I18nString.fromJson(Map<String, dynamic> json) : localizedStrings = {} {
    base = (json['base'] is String) ? json['base'] : '';
    for (var key in json.keys) {
      if (key != 'base' && json[key] is String) {
        localizedStrings[key] = json[key];
      }
    }
  }

  /// Returns a map with many pairs of key/I18nString, usually used to load a Json file with many
  /// localized string entries.
  static Map<String, I18nString> manyFromJson(Map<String, dynamic> json) {
    Map<String, I18nString> result = {};
    for (var key in json.keys) {
      if (json[key] is Map<String, dynamic>) {
        result[key] = I18nString.fromJson(json[key]);
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

  @override
  bool operator ==(covariant I18nString other) {
    return base == other.base && localizedStrings == other.localizedStrings;
  }
}
