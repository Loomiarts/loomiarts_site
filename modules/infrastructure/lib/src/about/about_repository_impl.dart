import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/services.dart';

/// Implementation of the about repository.
class AboutRepositoryImpl implements AboutRepository {

  @override
  Future<About> getAbout() async {
    final jsonString = await rootBundle.loadString('assets/about.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return About.fromJson(json);
  }
}
