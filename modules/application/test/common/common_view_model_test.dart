import 'package:application/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'common_view_model_test.mocks.dart';

@GenerateMocks([I18nRepository])
void main() {

  group('tests the common view model', () {

    final i18nRepository = MockI18nRepository();
    final viewModel = CommonViewModel(i18nRepository);

    test('returns available languages', () {
      expect(viewModel.languages, Language.values);
    });

    test('returns current language', () {
      // given:
      when(i18nRepository.currentLanguage).thenReturn(Language.portuguese);

      // then:
      expect(viewModel.language, Language.portuguese);
    });

  });
}
