import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/core/core.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MainAssets.logo),
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
