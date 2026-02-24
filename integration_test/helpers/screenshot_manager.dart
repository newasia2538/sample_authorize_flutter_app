import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class ScreenshotManager {

  static Future<void> shot(
      WidgetTester tester,
      String name,
      IntegrationTestWidgetsFlutterBinding binding,
      ) async {
    await tester.pumpAndSettle();
    await binding.takeScreenshot(name);
  }

  static Future<void> guard(
      WidgetTester tester, {
        required String testName,
        required Future<void> Function() body,
        required IntegrationTestWidgetsFlutterBinding binding,
      }) async {
    try {
      await body();

      /// optional success shot
      await tester.pumpAndSettle();
      await binding.takeScreenshot("${testName}_SUCCESS");

    } catch (error, stackTrace) {
      /// FAILURE screenshot automatically
      await tester.pumpAndSettle();
      await binding.takeScreenshot("${testName}_FAILED");

      print("TEST FAILED > screenshot captured");
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
