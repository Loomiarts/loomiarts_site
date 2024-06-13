import 'package:application/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_view_model_test.mocks.dart';

@GenerateMocks([HomeRouter, GameRepository])
void main() {

  group('executes the view model flow', () {

    final router = MockHomeRouter();
    final gameRepository = MockGameRepository();
    final viewModel = HomeViewModel(router, gameRepository);

    test('loads the view model data', () async {
      // given:
      final game1 = Game()
        ..name = LocString.base('Marvelous Game')
        ..developedBy = LocString.base('Loomiarts');
      final game2 = Game()
        ..name = LocString.base('Another Marvelous Game')
        ..developedBy = LocString.base('Loomiarts and Konami');
      when(gameRepository.getGames()).thenAnswer((_) {
        return Future.sync(() => [game1, game2]);
      });
      
      // when:
      await viewModel.load();

      // then:
      expect(viewModel.games.length, 2);
      expect(viewModel.games[0].name.toString(), 'Marvelous Game');
      expect(viewModel.games[0].developedBy.toString(), 'Loomiarts');
      expect(viewModel.games[1].name.toString(), 'Another Marvelous Game');
      expect(viewModel.games[1].developedBy.toString(), 'Loomiarts and Konami');
    });

    test('navigates to the selected game', () {
      // given:
      final game = Game()
        ..name = LocString.base('Marvelous Game')
        ..developedBy = LocString.base('Loomiarts');
      
      // when:
      viewModel.selectGame(game);

      // then:
      verify(router.navigateToGame(game));
    });

    test('navigates to the about page', () {
      // when:
      viewModel.selectAbout();

      // then:
      verify(router.navigateToAbout());
    });

  });
}
