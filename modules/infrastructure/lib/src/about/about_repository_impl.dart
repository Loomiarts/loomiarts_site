import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/services.dart';

/// Implementation of the about repository.
class AboutRepositoryImpl implements AboutRepository {

  @override
  Future<About> getAbout() async {
    final jsonString = await rootBundle.loadString('assets/about.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final about = About();
    if (json case {
      'text': String text,
      'email': String email,
      'socialMediaLinks': List socialMediaLinks
    }) {
      about.text = text;
      about.email = email;
      for (var link in socialMediaLinks) {
        if (link case {
          'name': String name,
          'url': String url,
        }) {
          about.socialMediaLinks.add(ExternalLink(name, url));
        }
      }
    }
    return about;
  }
}
