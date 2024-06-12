import 'package:application/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'about_view_model_test.mocks.dart';

@GenerateMocks([AboutRouter, AboutRepository])
void main() {

  group('executes the view model flow', () {

    final router = MockAboutRouter();
    final aboutRepository = MockAboutRepository();
    final viewModel = AboutViewModel(router, aboutRepository);

    test('loads the view model data', () {
      // given:
      final about = About()
        ..text = "Some text."
        ..email = "contact@loomiarts.com";
      when(aboutRepository.getAbout()).thenReturn(Future.sync(() => about));
      
      // when:
      viewModel.load();

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
