import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckAuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.authenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (route) => false);
        } else if (state.status == AuthStateStatus.unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.routeName, (route) => false);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
