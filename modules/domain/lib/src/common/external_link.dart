/// Data regarding an external link containing a title and the link itself..
class ExternalLink {
  String name = "";
  String url = "";

  ExternalLink(this.name, this.url);

  @override
  bool operator ==(covariant ExternalLink e) {
    return name == e.name && url == e.url;
  }
}
