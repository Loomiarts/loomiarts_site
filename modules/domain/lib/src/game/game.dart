import '../common/external_link.dart';

/// Describes a feature of a game.
class GameFeature {
  String title = "";
  String text = "";

  GameFeature(this.title, this.text);

  @override
  bool operator ==(covariant GameFeature other) {
    return title == other.title && text == other.text;
  }
}

/// Model containing data for a single game.
class Game {
  String name = '';
  String shortDescription = '';
  String posterImage = '';
  String bannerImage = '';
  String developedBy = '';
  String publishedBy = '';
  String genre = '';
  String internationalName = '';
  List<String> awards = [];
  List<GameFeature> features = [];
  List<ExternalLink> stores = [];
  List<ExternalLink> socialMediaLinks = [];
  List<ExternalLink> videos = [];
  List<ExternalLink> additionalLinks = [];

  Game();

  Game.fromJson(Map<String, dynamic> json) {
    if (json case {
      'name': String name,
      'developedBy': String developedBy,
      'publishedBy': String publishedBy,
      'genre': String genre,
      'shortDescription': String shortDescription,
      'internationalName': String internationalName,
      'awards': List<String> awards,
      'features': List features,
      'stores': List stores,
      'videos': List videos,
      'socialMediaLinks': List socialMediaLinks,
      'additionalLinks': List additionalLinks,
      'posterImage': String posterImage,
      'bannerImage': String bannerImage,
    }) {
      this.name = name;
      this.developedBy = developedBy;
      this.publishedBy = publishedBy;
      this.genre = genre;
      this.shortDescription = shortDescription;
      this.internationalName = internationalName;
      this.posterImage = posterImage;
      this.bannerImage = bannerImage;
      this.awards = awards;
      this.features = List.from(features.map((e) {
        if (e case {
          'title': String title,
          'text': String text,
        }) {
          return GameFeature(title, text);
        } else {
          return GameFeature('', '');
        }
      }));
      this.stores = List.from(stores.map((e) {
        if (e case {
          'name': String name,
          'url': String url,
        }) {
          return ExternalLink(name, url);
        } else {
          return ExternalLink('', '');
        }
      }));
      this.videos = List.from(videos.map((e) {
        if (e case {
          'name': String name,
          'url': String url,
        }) {
          return ExternalLink(name, url);
        } else {
          return ExternalLink('', '');
        }
      }));
      this.socialMediaLinks = List.from(socialMediaLinks.map((e) {
        if (e case {
          'name': String name,
          'url': String url,
        }) {
          return ExternalLink(name, url);
        } else {
          return ExternalLink('', '');
        }
      }));
      this.additionalLinks = List.from(additionalLinks.map((e) {
        if (e case {
          'name': String name,
          'url': String url,
        }) {
          return ExternalLink(name, url);
        } else {
          return ExternalLink('', '');
        }
      }));
    }
  }
}
