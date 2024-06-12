import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('initializes a Game object', () {

    test('extracts from JSON', () {
      // given:
      final json = {
        'name': 'The Game',
        'developedBy': 'The Game Maker',
        'publishedBy': 'The Game Publisher',
        'genre': 'Action',
        'shortDescription': 'This is a game.',
        'internationalName': 'Le Game',
        'posterImage': 'poster.png',
        'bannerImage': 'banner.png',
        'socialMediaLinks': [
          {
              'name': 'Twitter',
              'url': 'https://twitter.com/thegame'
          },
          {
              'name': 'Facebook',
              'url': 'https://fb.com/thegame'
          },
        ],
        'stores': [
          {
              'name': 'Steam',
              'url': 'www.steam.com/thegame'
          }
        ],
        'videos': [
          {
              'name': 'Trailer',
              'url': 'www.yt.com/thegametrailer'
          }
        ],
        'additionalLinks': [
          {
              'name': 'Read more',
              'url': 'www.site.com'
          }
        ],
        'awards': ["Oscar", "BIG Festival"],
        'features': [
          {
              'title': 'This is a game',
              'text': 'True story!'
          },
          {
              'title': 'Gameplay',
              'text': 'Play a game!'
          }
        ],
      };
      
      // when:
      final game = Game.fromJson(json);

      // then:
      expect(game.name, 'The Game');
      expect(game.developedBy, 'The Game Maker');
      expect(game.publishedBy, 'The Game Publisher');
      expect(game.genre, 'Action');
      expect(game.shortDescription, 'This is a game.');
      expect(game.internationalName, 'Le Game');
      expect(game.posterImage, 'poster.png');
      expect(game.bannerImage, 'banner.png');
      expect(game.socialMediaLinks, [
        ExternalLink('Twitter', 'https://twitter.com/thegame'),
        ExternalLink('Facebook', 'https://fb.com/thegame'),
      ]);
      expect(game.stores, [
        ExternalLink('Steam', 'www.steam.com/thegame'),
      ]);
      expect(game.videos, [
        ExternalLink('Trailer', 'www.yt.com/thegametrailer'),
      ]);
      expect(game.additionalLinks, [
        ExternalLink('Read more', 'www.site.com'),
      ]);
      expect(game.features, [
        GameFeature('This is a game', 'True story!'),
        GameFeature('Gameplay', 'Play a game!'),
      ]);
      expect(game.awards, ['Oscar', 'BIG Festival']);
    });

  });
}
