import '../common/external_link.dart';
import '../internationalization/i18n_string.dart';

/// Describes a feature of a game.
class GameFeature {
  I18nString title = I18nString.base('');
  I18nString text = I18nString.base('');

  GameFeature(this.title, this.text);

  GameFeature.fromJson(Map json) {
    if (json case {
      'title': Map<String, dynamic> title,
      'text': Map<String, dynamic> text,
    }) {
      this.title = I18nString.fromJson(title);
      this.text = I18nString.fromJson(text);
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
  String toString() {
    return '${title.toString()} - ${text.toString()}';
  }
}

/// Model containing data for a single game.
class Game {
  I18nString name = I18nString.base('');
  I18nString shortDescription = I18nString.base('');
  I18nString posterImage = I18nString.base('');
  I18nString bannerImage = I18nString.base('');
  I18nString developedBy = I18nString.base('');
  I18nString publishedBy = I18nString.base('');
  I18nString genre = I18nString.base('');
  I18nString alternativeName = I18nString.base('');
  List<I18nString> awards = [];
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
      this.name = I18nString.fromJson(name);
      this.developedBy = I18nString.fromJson(developedBy);
      this.publishedBy = I18nString.fromJson(publishedBy);
      this.genre = I18nString.fromJson(genre);
      this.shortDescription = I18nString.fromJson(shortDescription);
      this.alternativeName = I18nString.fromJson(alternativeName);
      this.posterImage = I18nString.fromJson(posterImage);
      this.bannerImage = I18nString.fromJson(bannerImage);
      this.awards = List<I18nString>.from(awards.map((e) => I18nString.fromJson(e)));
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
