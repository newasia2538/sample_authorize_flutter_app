import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sample_authorize_app/constant/keys.dart';
import 'package:sample_authorize_app/gen/locale_keys.g.dart';

import 'constants.dart';
import 'helpers/screenshot_manager.dart';
import 'helpers/test_bootstrap.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on login button, then authenticate user', (
        tester,
        ) async {

      await ScreenshotManager.guard(
        tester,
        testName: 'login_email_flow',
        binding: binding,
        body: () async {
          // Load app widget.
          await TestBootstrap.startApp(tester);

          // screenshot at start
          await ScreenshotManager.shot(tester, 'login_screen', binding);

          // Verify the login button existing.
          expect(find.text(LocaleKeys.login_resources_login_button_text.tr()), findsOneWidget);

          // Finds the login button.
          final emailTextField = find.byKey(emailAddressTextFieldKey);
          final passwordTextField = find.byKey(passwordTextFieldKey);
          final loginBtn = find.byKey(const ValueKey('login_btn'));

          // Emulate fill email and password then tap on the login button.
          await tester.enterText(emailTextField, 'tsa2@gmail.com');
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await tester.enterText(passwordTextField, '123123');
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await tester.tap(loginBtn);

          // Trigger a frame.
          await tester.pumpAndSettle(const Duration(seconds: 1));

          // checkpoint screenshot
          await ScreenshotManager.shot(tester, 'after_login', binding);

          // Verify email text field still showed
          expect(emailTextField, findsOneWidget);
        },
      );
    });

    testWidgets('tap on Google icon for sign up, then show tapping text', (
        tester,
        ) async {
      await ScreenshotManager.guard(
        tester,
        testName: 'login_email_flow',
        binding: binding,
        body: () async {
          // Load app widget.
          await TestBootstrap.startApp(tester);

          // screenshot at start
          await ScreenshotManager.shot(tester, 'login_screen', binding);

          // Verify the login button existing.
          expect(find.text(LocaleKeys.login_resources_login_button_text.tr()), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.GOOGLE_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.FACEBOOK_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.APPLE_ICON_FILE_NAME)), findsOneWidget);

          // Finds the login by GOOGLE button.
          final googleIconBtn = find.byKey(new ValueKey(TestConstants.GOOGLE_ICON_FILE_NAME));

          // prepare expected result ui
          final snackWithText = find.descendant(
            of: find.byType(SnackBar),
            matching: find.text('Google logged in !!!'),
          );

          // Emulate fill email and password then tap on the login button.
          await tester.tap(googleIconBtn);

          // Trigger a frame.
          await tester.pumpAndSettle(const Duration(seconds: 2));

          // checkpoint screenshot
          await ScreenshotManager.shot(tester, 'after_login', binding);

          // Verify the snack bar UI is show correctly
          expect(snackWithText, findsOneWidget);
        },
      );
    });

    testWidgets('tap on Facebook icon for sign up, then show tapping text', (
        tester,
        ) async {

      await ScreenshotManager.guard(
        tester,
        testName: 'login_email_flow',
        binding: binding,
        body: () async {
          // Load app widget.
          await TestBootstrap.startApp(tester);

          // screenshot at start
          await ScreenshotManager.shot(tester, 'login_screen', binding);

          // Verify the login button existing.
          expect(find.text(LocaleKeys.login_resources_login_button_text.tr()), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.GOOGLE_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.FACEBOOK_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.APPLE_ICON_FILE_NAME)), findsOneWidget);

          // Finds the login by GOOGLE button.
          final facebookIconBtn = find.byKey(new ValueKey(TestConstants.FACEBOOK_ICON_FILE_NAME));

          // prepare expected result ui
          final snackWithText = find.descendant(
            of: find.byType(SnackBar),
            matching: find.text('Facebook logged in !!!'),
          );

          // Emulate fill email and password then tap on the login button.
          await tester.tap(facebookIconBtn);

          // Trigger a frame.
          await tester.pumpAndSettle(const Duration(seconds: 2));

          // checkpoint screenshot
          await ScreenshotManager.shot(tester, 'after_login', binding);

          // Verify the snack bar UI is show correctly
          expect(snackWithText, findsOneWidget);
        },
      );
    });

    testWidgets('tap on Apple icon for sign up, then show tapping text', (
        tester,
        ) async {

      await ScreenshotManager.guard(
        tester,
        testName: 'login_email_flow',
        binding: binding,
        body: () async {
          // Load app widget.
          await TestBootstrap.startApp(tester);

          // screenshot at start
          await ScreenshotManager.shot(tester, 'login_screen', binding);

          // Verify the login button existing.
          expect(find.text(LocaleKeys.login_resources_login_button_text.tr()), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.GOOGLE_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.FACEBOOK_ICON_FILE_NAME)), findsOneWidget);
          expect(find.byKey(new ValueKey(TestConstants.APPLE_ICON_FILE_NAME)), findsOneWidget);

          // Finds the login by GOOGLE button.
          final appleIconBtn = find.byKey(new ValueKey(TestConstants.APPLE_ICON_FILE_NAME));

          // prepare expected result ui
          final snackWithText = find.descendant(
            of: find.byType(SnackBar),
            matching: find.text('Apple logged in !!!'),
          );

          // Emulate fill email and password then tap on the login button.
          await tester.tap(appleIconBtn);

          // Trigger a frame.
          await tester.pumpAndSettle(const Duration(seconds: 2));

          // checkpoint screenshot
          await ScreenshotManager.shot(tester, 'after_login', binding);

          // Verify the snack bar UI is show correctly
          expect(snackWithText, findsOneWidget);
        },
      );
    });
  });
}
