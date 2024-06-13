import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

/// Interface that handles the change of language.
abstract interface class I18nDelegate<T extends StatefulWidget> extends State<T> {
  set language(Language newLanguage);
}
