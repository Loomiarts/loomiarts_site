/// Data regarding an external link containing a title and the link itself..
class ExternalLink {
  String name = "";
  String url = "";

  ExternalLink(this.name, this.url);

  ExternalLink.fromJson(Map json) {
    if (json case {
      'name': String name,
      'url': String url,
    }) {
      this.name = name;
      this.url = url;
    }
  }

  static List<ExternalLink> manyFromJson(List json) {
    return List.from(json.map((e) {
      return ExternalLink.fromJson(e);
    }));
  }

  @override
  bool operator ==(covariant ExternalLink e) {
    return name == e.name && url == e.url;
  }
}
