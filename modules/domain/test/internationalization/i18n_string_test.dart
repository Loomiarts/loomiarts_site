import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('extracts from JSON maps', () {

    test('gets the string with toString', () {
      // given:
      final str = I18nString('hello, world!', localizedStrings: {'pt': 'olá, mundo!'});

      // then:
      expect(str.toString(), 'hello, world!');
      expect(str.toString(languageCode: 'pt'), 'olá, mundo!');
      expect(str.toString(languageCode: 'unknow'), 'hello, world!');
    });

    test('extracts one object from JSON', () {
      // given:
      Map<String, dynamic> json = {
        'base': 'hello, world!',
        'pt': 'olá, mundo!',
        'it': 'ciao mondo!',
      };

      // when:
      final result = I18nString.fromMap(json);

      // then:
      expect(result.base, 'hello, world!');
      expect(result.localizedStrings.length, 2);
      expect(result.localizedStrings['pt'], 'olá, mundo!');
      expect(result.localizedStrings['it'], 'ciao mondo!');
    });

    test('extracts one object from empty JSON', () {
      // given:
      Map<String, dynamic> json = {};

      // when:
      final result = I18nString.fromMap(json);

      // then:
      expect(result.base, '');
      expect(result.localizedStrings.length, 0);
    });

    test('extracts one object without base', () {
      // given:
      Map<String, dynamic> json = {
        'pt': 'olá, mundo!',
        'it': 'ciao mondo!',
      };

      // when:
      final result = I18nString.fromMap(json);

      // then:
      expect(result.base, '');
      expect(result.localizedStrings.length, 2);
      expect(result.localizedStrings['pt'], 'olá, mundo!');
      expect(result.localizedStrings['it'], 'ciao mondo!');
    });

    test('extracts one object ignoring non-string values', () {
      // given:
      Map<String, dynamic> json = {
        'base': 123,
        'pt': {},
        'it': false,
      };

      // when:
      final result = I18nString.fromMap(json);

      // then:
      expect(result.base, '');
      expect(result.localizedStrings.length, 0);
    });

    test('extracts many objects from JSON', () {
      // given:
      Map<String, dynamic> json = {
        'str1': {
          'base': 'hello, world!',
          'pt': 'olá, mundo!',
        },
        'str2': {
          'base': 'another string'
        }
      };

      // when:
      final result = I18nString.manyFromMap(json);

      // then:
      expect(result.length, 2);
      expect(result['str1']!.base, 'hello, world!');
      expect(result['str1']!.localizedStrings['pt'], 'olá, mundo!');
      expect(result['str2']!.base, 'another string');
    });

    test('extracts many objects from JSON ignoring non-objects', () {
      // given:
      Map<String, dynamic> json = {
        'str1': 123,
        'str2': {
          'base': 'another string'
        }
      };

      // when:
      final result = I18nString.manyFromMap(json);

      // then:
      expect(result.length, 1);
      expect(result['str2']!.base, 'another string');
    });

  });
}
