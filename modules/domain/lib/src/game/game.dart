import '../common/external_link.dart';

/// Describes a feature of a game.
class GameFeature {
  String title = "";
  String text = "";

  GameFeature(this.title, this.text);
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
}
