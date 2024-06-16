import '../common/external_link.dart';
import '../internationalization/loc_string.dart';

/// Describes a feature of a game.
class GameFeature {
  LocString title = LocString.base('');
  LocString text = LocString.base('');

  GameFeature(this.title, this.text);

  GameFeature.fromJson(Map json) {
    if (json case {
      'title': Map<String, dynamic> title,
      'text': Map<String, dynamic> text,
    }) {
      this.title = LocString.fromJson(title);
      this.text = LocString.fromJson(text);
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
  
  @override
  int get hashCode {
    return Object.hash(title, text);
  }

  @override
  String toString() {
    return '${title.toString()} - ${text.toString()}';
  }
}

/// Model containing data for a single game.
class Game {
  LocString name = LocString.base('');
  LocString shortDescription = LocString.base('');
  LocString posterImage = LocString.base('');
  LocString bannerImage = LocString.base('');
  LocString developedBy = LocString.base('');
  LocString publishedBy = LocString.base('');
  LocString genre = LocString.base('');
  LocString alternativeName = LocString.base('');
  List<LocString> awards = [];
  List<GameFeature> features = [];
  List<ExternalLink> stores = [];
  List<ExternalLink> socialMediaLinks = [];
  List<ExternalLink> videos = [];
  List<ExternalLink> additionalLinks = [];

  Game();

  Game.fromJson(Map json) {
    if (json case {
      'name': Map<String, dynamic> name,
      'developedBy': Map<String, dynamic> developedBy,
      'publishedBy': Map<String, dynamic> publishedBy,
      'genre': Map<String, dynamic> genre,
      'shortDescription': Map<String, dynamic> shortDescription,
      'alternativeName': Map<String, dynamic> alternativeName,
      'awards': List awards,
      'features': List features,
      'stores': List stores,
      'videos': List videos,
      'socialMediaLinks': List socialMediaLinks,
      'additionalLinks': List additionalLinks,
      'posterImage': Map<String, dynamic> posterImage,
      'bannerImage': Map<String, dynamic> bannerImage,
    }) {
      this.name = LocString.fromJson(name);
      this.developedBy = LocString.fromJson(developedBy);
      this.publishedBy = LocString.fromJson(publishedBy);
      this.genre = LocString.fromJson(genre);
      this.shortDescription = LocString.fromJson(shortDescription);
      this.alternativeName = LocString.fromJson(alternativeName);
      this.posterImage = LocString.fromJson(posterImage);
      this.bannerImage = LocString.fromJson(bannerImage);
      this.awards = List<LocString>.from(awards.map((e) => LocString.fromJson(e)));
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
