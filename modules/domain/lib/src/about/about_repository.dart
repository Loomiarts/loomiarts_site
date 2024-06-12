import 'about.dart';

abstract interface class AboutRepository {
  Future<About> getAbout();
}
