/// A small part/section of the description of a game.
class GameInfo {
  String title = "";
  String text = "";
}

/// Data regarding an external link related to a game, like a store and it's URL.
class GameExternalLink {
  String name = "";
  String url = "";
}

/// Model containing data for a single game.
class Game {
  String name = "";
  String developedBy = "";
  String publishedBy = "";
  String genre = "";
  List<GameInfo> info = [];
  List<GameExternalLink> stores = [];
  List<GameExternalLink> socialNetworks = [];
  List<GameExternalLink> videos = [];
}
