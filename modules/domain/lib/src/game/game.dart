import '../common/external_link.dart';

/// Describes a feature of a game.
class GameFeature {
  String title = "";
  String text = "";

  GameFeature(this.title, this.text);

  GameFeature.fromJson(Map json) {
    if (json case {
      'title': String title,
      'text': String text,
    }) {
      this.title = title;
      this.text = text;
    }
  }

  static List<GameFeature> manyFromJson(List json) {
    return List.from(json.map((e) {
      return GameFeature.fromJson(e);
    }));
  }

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

  Game.fromJson(Map json) {
    if (json case {
      'name': String name,
      'developedBy': String developedBy,
      'publishedBy': String publishedBy,
      'genre': String genre,
      'shortDescription': String shortDescription,
      'internationalName': String internationalName,
      'awards': List awards,
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
      this.awards = List<String>.from(awards.map((e) => e as String));
      this.features = GameFeature.manyFromJson(features);
      this.stores = ExternalLink.manyFromJson(stores);
      this.videos = ExternalLink.manyFromJson(videos);
      this.socialMediaLinks = ExternalLink.manyFromJson(socialMediaLinks);
      this.additionalLinks = ExternalLink.manyFromJson(additionalLinks);
    }
  }

  static List<Game> manyFromJson(List json) {
    return List.from(json.map((e) {
      return Game.fromJson(e);
    }));
  }
}
