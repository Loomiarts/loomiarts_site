import 'package:application/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'game_view_model_test.mocks.dart';

@GenerateMocks([GameRouter])
void main() {

  group('executes the view model flow', () {

    final game = Game();
    final router = MockGameRouter();
    final viewModel = GameViewModel(router, game);

    test('navigates back', () {
      // when:
      viewModel.navigateBack();

      // then:
      verify(router.navigateBack());
    });

    test('navigates to social media link', () {
      // when:
      viewModel.openSocialMediaLink(ExternalLink('Twitter', 'https://twitter.com/loomiarts'));

      // then:
      verify(router.navigateToExternalLink(ExternalLink('Twitter', 'https://twitter.com/loomiarts')));
    });

    test('navigates to store link', () {
      // when:
      viewModel.openStore(ExternalLink('Steam', 'https://steam.com/mygame'));

      // then:
      verify(router.navigateToExternalLink(ExternalLink('Steam', 'https://steam.com/mygame')));
    });

    test('navigates to video', () {
      // when:
      viewModel.openVideo(ExternalLink('Trailer', 'https://youtube.com/123456'));

      // then:
      verify(router.navigateToExternalLink(ExternalLink('Trailer', 'https://youtube.com/123456')));
    });
  });
}