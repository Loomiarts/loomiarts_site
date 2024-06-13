import '../common/external_link.dart';
import '../internationalization/loc_string.dart';

/// The 'about' related data.
class About {
  LocString text = LocString.base("");
  LocString email = LocString.base("");
  List<ExternalLink> socialMediaLinks = [];

  About();

  About.fromJson(Map<String, dynamic> json) {
    if (json case {
      'text': Map<String, dynamic> text,
      'email': Map<String, dynamic> email,
      'socialMediaLinks': List socialMediaLinks
    }) {
      this.text = LocString.fromJson(text);
      this.email = LocString.fromJson(email);
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
