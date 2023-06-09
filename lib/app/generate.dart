import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/cart/cart.dart';
import 'package:shamo_mobile/features/home/home.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/transaction/transaction.dart';

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
    case CartPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CartPage(),
        settings: settings,
      );
    case ProductPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProductPage(),
        settings: settings,
      );
    case CheckoutPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CheckoutPage(),
        settings: settings,
      );
    case CheckoutSuccessPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CheckoutSuccessPage(),
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
