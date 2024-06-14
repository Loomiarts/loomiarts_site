import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrastructure/src/internationalization/i18n_delegate.dart';

class I18nRepositoryImpl implements I18nRepository {

  static Map<String, LocString> _strings = {};

  final BuildContext? _buildContext;

  I18nRepositoryImpl(this._buildContext);

  I18nRepositoryImpl.withoutContext(): _buildContext = null;
  
  @override
  Future<void> loadStrings() async {
    final jsonString = await rootBundle.loadString('assets/texts.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    _strings = LocString.manyFromJson(json);
  }

  @override
  Map<String, LocString> getAllStrings() {
    return _strings;
  }

  @override
  Language get currentLanguage {
    if (_buildContext == null) {
      return Language.english;
    }
    Locale locale = Localizations.localeOf(_buildContext);
    return Language.fromLanguageCode(locale.languageCode) ?? Language.english;
  }

  @override
  set currentLanguage(Language newCurrentLanguage) {
    I18nDelegate? delegate = _buildContext?.findAncestorStateOfType<I18nDelegate>();
    delegate?.language = newCurrentLanguage;
  }
}
