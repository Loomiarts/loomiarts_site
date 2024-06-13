import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('initializes a Game object', () {

    test('extracts from JSON', () {
      // given:
      final json = {
        'name': {'base': 'The Game'},
        'developedBy': {'base': 'The Game Maker'},
        'publishedBy': {'base': 'The Game Publisher'},
        'genre': {'base': 'Action'},
        'shortDescription': {'base': 'This is a game.'},
        'alternativeName': {'base': 'Le Game'},
        'posterImage': {'base': 'poster.png'},
        'bannerImage': {'base': 'banner.png'},
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
        'awards': [{'base': 'Oscar'}, {'base': 'BIG Festival'}],
        'features': [
          {
              'title': {'base': 'This is a game'},
              'text': {'base': 'True story!'}
          },
          {
              'title': {'base': 'Gameplay'},
              'text': {'base': 'Play a game!'}
          }
        ],
      };
      
      // when:
      final game = Game.fromJson(json);

      // then:
      expect(game.name.toString(), 'The Game');
      expect(game.developedBy.toString(), 'The Game Maker');
      expect(game.publishedBy.toString(), 'The Game Publisher');
      expect(game.genre.toString(), 'Action');
      expect(game.shortDescription.toString(), 'This is a game.');
      expect(game.alternativeName.toString(), 'Le Game');
      expect(game.posterImage.toString(), 'poster.png');
      expect(game.bannerImage.toString(), 'banner.png');
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
        GameFeature(I18nString.base('This is a game'), I18nString.base('True story!')),
        GameFeature(I18nString.base('Gameplay'), I18nString.base('Play a game!')),
      ]);
      expect(game.awards, [I18nString.base('Oscar'), I18nString.base('BIG Festival')]);
    });

    test('extracts many from JSON', () {
      // given:
      final json = [
        {
          'name': {'base': 'The Game'},
          'developedBy': {'base': 'The Game Maker'},
          'publishedBy': {'base': 'The Game Publisher'},
          'genre': {'base': 'Action'},
          'shortDescription': {'base': 'This is a game.'},
          'alternativeName': {'base': 'Le Game'},
          'posterImage': {'base': 'poster.png'},
          'bannerImage': {'base': 'banner.png'},
          'socialMediaLinks': <Map<String, dynamic>>[],
          'stores': <Map<String, dynamic>>[],
          'videos': <Map<String, dynamic>>[],
          'additionalLinks': <Map<String, dynamic>>[],
          'awards': [{'base': 'Oscar'}, {'base': 'BIG Festival'}],
          'features': <Map<String, dynamic>>[],
        },
        {
          'name': {'base': 'The Game 2'},
          'developedBy': {'base': 'The Game Maker'},
          'publishedBy': {'base': 'The Game Publisher'},
          'genre': {'base': 'Action'},
          'shortDescription': {'base': 'This is a game sequel.'},
          'alternativeName': {'base': 'Le Game 2'},
          'posterImage': {'base': 'poster2.png'},
          'bannerImage': {'base': 'banner2.png'},
          'socialMediaLinks': <Map<String, dynamic>>[],
          'stores': <Map<String, dynamic>>[],
          'videos': <Map<String, dynamic>>[],
          'additionalLinks': <Map<String, dynamic>>[],
          'awards': [{'base': 'Oscar'}, {'base': 'BIG Festival'}],
          'features': <Map<String, dynamic>>[],
        }
      ];
      
      // when:
      final games = Game.manyFromJson(json);

      // then:
      expect(games.length, 2);
      expect(games[0].name.toString(), 'The Game');
      expect(games[1].name.toString(), 'The Game 2');
    });

  });
}
