import '../common/external_link.dart';

/// The 'about' related data.
class About {
  String text = "";
  String email = "";
  List<ExternalLink> socialMediaLinks = [];

  About();

  About.fromJson(Map<String, dynamic> json) {
    if (json case {
      'text': String text,
      'email': String email,
      'socialMediaLinks': List socialMediaLinks
    }) {
      this.text = text;
      this.email = email;
      for (var link in socialMediaLinks) {
        if (link case {
          'name': String name,
          'url': String url,
        }) {
          this.socialMediaLinks.add(ExternalLink(name, url));
        }
      }
    }
  }
}