import 'package:collection/collection.dart';

/// Object that wraps a string with a base value and alternative localized values.
class LocString {
  late final String base;
  final Map<String, String> localizedStrings;

  LocString(this.base, {required this.localizedStrings});

  LocString.base(this.base) : localizedStrings = {};

  /// Initializes from a Json map.
  LocString.fromJson(Map<String, dynamic> json) : localizedStrings = {} {
    base = (json['base'] is String) ? json['base'] : '';
    for (var key in json.keys) {
      if (key != 'base' && json[key] is String) {
        localizedStrings[key] = json[key];
      }
    }
  }

  /// Returns a map with many pairs of key/LocString, usually used to load a Json file with many
  /// localized string entries.
  static Map<String, LocString> manyFromJson(Map<String, dynamic> json) {
    Map<String, LocString> result = {};
    for (var key in json.keys) {
      if (json[key] is Map<String, dynamic>) {
        result[key] = LocString.fromJson(json[key]);
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
  bool operator ==(Object other) {
    if (other is LocString) {
      return (base == other.base) && const MapEquality().equals(localizedStrings, other.localizedStrings);
    } else if (other is String) {
      return base == other;
    } else {
      return false;
    }
  }
}
