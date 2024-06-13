enum Language {

  english('en', 'English'),
  portuguese('pt', 'Português');

  final String languageCode;
  final String name;

  const Language(this.languageCode, this.name);

  static Language? fromLanguageCode(String languageCode) {
    return values.firstWhere((l) => l.languageCode == languageCode);
  }
}
