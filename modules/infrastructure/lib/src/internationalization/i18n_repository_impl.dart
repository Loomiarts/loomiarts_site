import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/services.dart';

class I18nRepositoryImpl implements I18nRepository {

  static Map<String, LocString> _strings = {};
  
  @override
  Future<void> loadStrings() async {
    final jsonString = await rootBundle.loadString('assets/texts.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    _strings = LocString.manyFromJson(json);
  }

  @override
  Map<String, LocString> getAll() {
    return _strings;
  }
}
