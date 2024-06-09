import '../common/external_link.dart';

/// A small part/section of the description of a game.
class GameInfo {
  String title = "";
  String text = "";
}

/// Model containing data for a single game.
class Game {
  String name = "";
  String posterImage = "";
  String developedBy = "";
  String publishedBy = "";
  String genre = "";
  List<GameInfo> info = [];
  List<ExternalLink> stores = [];
  List<ExternalLink> socialMediaLinks = [];
  List<ExternalLink> videos = [];
}
