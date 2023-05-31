import 'package:flutter/material.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    login();
  }

  void login() {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MainAssets.logo,
              width: Dimens.width(context) / 3,
            ),
            Dimens.dp40.height,
            HeadingText(
              AppConfig.appName.toUpperCase(),
              style: const TextStyle(letterSpacing: Dimens.dp8),
            ),
          ],
        ),
      ),
    );
  }
}
