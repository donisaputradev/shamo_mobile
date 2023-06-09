import 'package:shamo_mobile/app/flavor.dart';
import 'package:shamo_mobile/core/core.dart';

/// Base Config in App
class AppConfig {
  // ---------------------------------------------------------------------------
  //                               CORE CONFIG                                \\
  // ---------------------------------------------------------------------------

  /// - Title App in Browser Tab
  /// - Tiitle App in Recent App Android/IOS
  ///
  /// This config set `title` in `MaterialApp`
  /// And by default title in `MaterialApp` change
  static const String appName = 'Shamo';
  static const String fontFamily = 'Poppins';
  static const String profileUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  /// Base URL APIs App
  static const FlavorConfig<String> baseUrl = FlavorConfig<String>(
    /// Base URL in Production Mode
    prod: 'https://shamo.donisaputra.com/api',

    /// Base URL in Development Mode
    dev: 'https://shamo.donisaputra.com/api',

    /// Base URL in Staging Mode
    stag: 'https://shamo.donisaputra.com/api',
  );

  static const String noImageUrl =
      'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg';

  // ---------------------------------------------------------------------------
  //                              END CORE CONFIG                             \\
  // ---------------------------------------------------------------------------

  /// Default theme before user change theme
  ///
  /// If the user changes the theme in the app,
  /// the theme will be adjusted according to the user's choice.
  /// And the app's theme is stored in the device cache.
  /// When the user opens the application
  /// then the theme will be set according to the saved theme
  static const AppTheme defaultTheme = AppTheme.dark;

  /// Global `stringify` setting for all `Equatable` instances.
  ///
  /// If `stringify` is overridden for a particular `Equatable` instance,
  /// then the local `stringify` value takes precedence
  /// over `AppConfig.stringify`.
  ///
  /// This value defaults to true in debug mode and false in release mode.
  static const bool autoStringifyEquatable = true;

  /// Make overlay statusbar in Android transparent,
  ///
  /// When use `AppBar` background `statusbar` is background `AppBar`
  static const bool transparentStatusBar = true;
}

/// Config multiple flavors
class FlavorConfig<T> {
  const FlavorConfig({
    required this.dev,
    required this.prod,
    required this.stag,
    this.fallback,
  }) : assert(
          dev == null || prod == null || stag == null ? fallback != null : true,
          '[fallback]cannot be null if there is one flavor whose value is null',
        );

  final T? dev;
  final T? prod;
  final T? stag;
  final T? fallback;

  T get value {
    switch (F.flavor) {
      case Flavor.dev:
        return dev ?? fallback!;
      case Flavor.stag:
        return stag ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
