import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'about_view_model_test.mocks.dart';

@GenerateMocks([AboutRouter, AboutRepository, I18nRepository])
void main() {

  group('executes the view model flow', () {

    final router = MockAboutRouter();
    final aboutRepository = MockAboutRepository();
    final i18nRepository = MockI18nRepository();
    final viewModel = AboutViewModel(router, aboutRepository, i18nRepository);

    test('loads the view model data', () async {
      // given:
      final about = About()
        ..text = LocString.base("Some text.")
        ..email = LocString.base("contact@loomiarts.com");
      when(aboutRepository.getAbout()).thenAnswer((_) {
        return Future.sync(() => about);
      });
      
      // when:
      await viewModel.load();

      // then:
      expect(viewModel.about, about);
    });

    test('navigates back', () {
      // when:
      viewModel.navigateBack();

      // then:
      verify(router.navigateBack());
    });
  });
}
