import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('tests the Language', () {

    test('gets from language code', () {
      expect(Language.fromLanguageCode('en'), Language.english);
      expect(Language.fromLanguageCode('pt'), Language.portuguese);
      expect(Language.fromLanguageCode('xx'), null);
    });

  });
}
