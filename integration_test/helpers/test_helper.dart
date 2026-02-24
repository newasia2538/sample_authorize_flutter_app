import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_authorize_app/firebase_options.dart';
import 'package:sample_authorize_app/main.dart';

class TestHelper{
  static Future<void> pumpLocalizedApp(WidgetTester tester) async {
    await EasyLocalization.ensureInitialized();

    await Firebase.initializeApp(
      name: DefaultFirebaseOptions.currentPlatform.projectId,
      options: DefaultFirebaseOptions.currentPlatform,
    );

    listenAuthStateChange();
    listenUserChange();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('th', 'TH')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: const ProviderScope(child: MyApp(),),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  static void listenUserChange() {
    FirebaseAuth.instance
        .userChanges()
        .listen((User? user) {
      if (user == null) {
        print('[FirebaseAuth.instance.userChanges] : User is currently signed out!');
      } else {
        print('[FirebaseAuth.instance.userChanges] : User is signed in!');
      }
    });
  }

  static void listenAuthStateChange() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('[FirebaseAuth.instance.authStateChanges] : User is currently signed out!');
      } else {
        print('[FirebaseAuth.instance.authStateChanges] : User is signed in!');
      }
    });
  }

  static Future<void> iosScreenshot(String name) async {
    if (Platform.isIOS) {
      await Process.run(
        'xcrun',
        ['simctl', 'io', 'booted', 'screenshot', '$name.png'],
      );
    }
  }
}