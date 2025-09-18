import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/presentation/sign_in/sign_in_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample_authorize_app/presentation/start_page.dart';
import 'configurations/app_router.dart';
import 'configurations/route_path.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await runZonedGuarded(() async {

    await Firebase.initializeApp(
      name: DefaultFirebaseOptions.currentPlatform.projectId,
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _listenAuthStateChange();
    _listenUserChange();

    runApp(
      EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('th', 'TH')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: const ProviderScope(child: MyApp(),),
      )
  );
  }, (error, trace){

  });
}

void _listenUserChange() {
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

void _listenAuthStateChange() {
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), fontFamily: 'Arimo',),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RoutePath.main,
      onGenerateRoute: AppRouter.generateRoute,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Scaffold(body: SafeArea(child: Center(child: StartPage())));
  }
}
