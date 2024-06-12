// Mocks generated by Mockito 5.4.4 from annotations
// in application/test/about/about_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:application/src/about/about_router.dart' as _i3;
import 'package:domain/domain.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAbout_0 extends _i1.SmartFake implements _i2.About {
  _FakeAbout_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AboutRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAboutRouter extends _i1.Mock implements _i3.AboutRouter {
  MockAboutRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void navigateBack() => super.noSuchMethod(
        Invocation.method(
          #navigateBack,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void navigateToSocialMediaLink(_i2.ExternalLink? link) => super.noSuchMethod(
        Invocation.method(
          #navigateToSocialMediaLink,
          [link],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AboutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAboutRepository extends _i1.Mock implements _i2.AboutRepository {
  MockAboutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.About> getAbout() => (super.noSuchMethod(
        Invocation.method(
          #getAbout,
          [],
        ),
        returnValue: _i4.Future<_i2.About>.value(_FakeAbout_0(
          this,
          Invocation.method(
            #getAbout,
            [],
          ),
        )),
      ) as _i4.Future<_i2.About>);
}
