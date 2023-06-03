import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shamo_mobile/app/config.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/product/data/repositories/product_repository.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  await _setupCore();

  // |+-----------------------------------------------------------------------+|
  // |+                               FEATURES                                +|
  // |+-----------------------------------------------------------------------+|

  // ------------------------------ AUTHENTICATION ---------------------------------
  getIt
    ..registerLazySingleton<AuthApiDataSource>(
      () => AuthApiDataSourceImpl(
        authLocalDataSource: getIt(),
        dio: getIt(),
      ),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt()),
    );

  // Domain
  getIt
    ..registerLazySingleton(() => FetchUserUseCase(getIt()))
    ..registerLazySingleton(() => LoginUseCase(getIt()))
    ..registerLazySingleton(() => RegisterUseCase(getIt()))
    ..registerLazySingleton(() => LogoutUseCase(getIt()));

  // Presentation
  getIt.registerFactory(
    () => AuthBloc(
      fetchUserUseCase: getIt(),
      loginUseCase: getIt(),
      logoutUseCase: getIt(),
      registerUseCase: getIt(),
    ),
  );

  // ------------------------------ END AUTHENTICATION -----------------------------

  // ------------------------------ PRODUCT ---------------------------------
  getIt
    ..registerLazySingleton<ProductApiDataSource>(
      () => ProductApiDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()),
    );

  // Domain
  getIt
    ..registerLazySingleton(() => FetchCategoriesUseCase(getIt()))
    ..registerLazySingleton(() => FetchListProductUseCase(getIt()))
    ..registerLazySingleton(() => FetchProductUseCase(getIt()));

  // Presentation
  getIt
    ..registerFactory(
      () => CategoryBloc(fetchCategoriesUseCase: getIt()),
    )
    ..registerFactory(
      () => PopularBloc(fetchListProductUseCase: getIt()),
    )
    ..registerFactory(
      () => ProductBloc(fetchListProductUseCase: getIt()),
    );

  // ------------------------------ END PRODUCT -----------------------------

  // ------------------------------ SETTINGS ---------------------------------

  // Data
  getIt
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(localDataSource: getIt()),
    );

  // Domain
  getIt
    ..registerLazySingleton(() => GetLanguageSettingUseCase(getIt()))
    ..registerLazySingleton(() => GetSettingsUseCase(getIt()))
    ..registerLazySingleton(() => GetThemeSettingUseCase(getIt()))
    ..registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()))
    ..registerLazySingleton(() => SaveSettingsUseCase(getIt()))
    ..registerLazySingleton(() => SaveThemeSettingUseCase(getIt()))
    ..registerLazySingleton(GetSupportedLanguageUseCase.new)
    ..registerLazySingleton(RecordErrorUseCase.new)
    ..registerLazySingleton(GetOnboardingDataUseCase.new)
    ..registerLazySingleton(() => SetDoneOnboardingUseCase(getIt()))
    ..registerLazySingleton(() => GetOnboardingStatusUseCase(getIt()));

  // Presentation
  getIt
    ..registerFactory(
      () => LanguageBloc(
        getLanguageSetting: getIt(),
        saveLanguageSetting: getIt(),
        getSupportedLanguage: getIt(),
      ),
    )
    ..registerFactory(
      () => ThemeBloc(
        getThemeSetting: getIt(),
        saveThemeSetting: getIt(),
      ),
    )
    ..registerFactory(() => UserBloc(fetchUserUseCase: getIt()));

  // ------------------------------ END SETTINGS -------------------------------

  // |+-----------------------------------------------------------------------+|
  // |+                             END FEATURES                              +|
  // |+-----------------------------------------------------------------------+|
}

Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  // External
  getIt.registerLazySingleton(InternetConnectionChecker.new);
  getIt.registerLazySingleton(
    () => CaptureErrorUseCase(),
  );

  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: AppConfig.baseUrl.value,
      )
      ..interceptors.addAll([
        LogInterceptor(requestBody: true, responseBody: true),
        AuthHttpInterceptor(authLocalDataSource: getIt(), onUnAuth: () {}),
      ]),
  );

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  // Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );
}
