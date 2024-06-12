import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('initializes an About object', () {

    test('gets the string with toString', () {
      // given:
      final json = {
        'text': 'sample text',
        'email': 'john@beatles.com',
        'socialMediaLinks': [
          {
              'name': 'Twitter',
              'url': 'https://twitter.com/beatles'
          },
          {
              'name': 'Facebook',
              'url': 'https://fb.com/beatles'
          }
        ]
      };
      
      // when:
      final about = About.fromJson(json);

      // then:
      expect(about.text, 'sample text');
      expect(about.email, 'john@beatles.com');
      expect(about.socialMediaLinks, [
        ExternalLink('Twitter', 'https://twitter.com/beatles'),
        ExternalLink('Facebook', 'https://fb.com/beatles'),
      ]);
    });

  });
}
