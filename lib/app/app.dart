import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/app/generate.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/settings/settings.dart';
import 'package:shamo_mobile/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            AppConfig.transparentStatusBar ? Colors.transparent : null,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<ThemeBloc>()..add(const ThemeStarted()),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I<LanguageBloc>()..add(const LanguageStarted()),
        ),
        BlocProvider(create: (context) => GetIt.I<AuthBloc>()),
      ],
      child: const _AppWidget(),
    );
  }
}

class _AppWidget extends StatefulWidget {
  const _AppWidget({Key? key}) : super(key: key);

  @override
  State<_AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<_AppWidget> {
  @override
  void initState() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.black
      ..radius = 16
      ..errorWidget
      ..backgroundColor = context.theme.canvasColor
      ..indicatorColor = context.theme.primaryColor
      ..textColor = context.theme.shadowColor
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageState = context.watch<LanguageBloc>().state;
    final themeState = context.watch<ThemeBloc>().state;

    return MaterialApp(
      title: AppConfig.appName,
      theme: themeState.theme.toThemeData(),
      locale: languageState.language != null
          ? Locale(languageState.language!.code)
          : null,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [routeObserver],
      onGenerateRoute: onGenerateRoute,
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }
}
