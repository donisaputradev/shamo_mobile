import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/home/home.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
    case RegisterPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );
    case MainPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
