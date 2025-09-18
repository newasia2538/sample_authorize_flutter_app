import 'package:flutter/material.dart';
import 'package:sample_authorize_app/configurations/route_path.dart';
import 'package:sample_authorize_app/presentation/create_account/create_account_view.dart';
import 'package:sample_authorize_app/presentation/sign_in/sign_in_view.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutePath.main:
      case RoutePath.signIn:
        return MaterialPageRoute(settings: const RouteSettings(name: RoutePath.main),
        builder: (_) => const SignInView());
      case RoutePath.createAccount:
        return MaterialPageRoute(settings: const RouteSettings(name: RoutePath.createAccount),
            builder: (_) => CreateAccountView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(''),
            ),
          ),
        );
    }
  }
}