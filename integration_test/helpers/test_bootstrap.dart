import 'package:flutter_test/flutter_test.dart';

import 'test_helper.dart';

class TestBootstrap {

  static Future<void> startApp(
      WidgetTester tester,
      ) async {

    await TestHelper.pumpLocalizedApp(tester);

    await tester.pumpAndSettle(
      const Duration(seconds: 3),
    );
  }
}
