import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.localDataSource});

  final SettingsLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Language>> getLanguageSetting() async {
    try {
      final result = await localDataSource.getData();

      if (result.language != null) {
        return Right(result.language!);
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, Settings>> getSettings() async {
    try {
      final result = await localDataSource.getData();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, AppTheme>> getThemeSetting() async {
    try {
      final result = await localDataSource.getData();

      if (result.theme != null) {
        return Right(result.theme!);
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveSettings(Settings setting) async {
    try {
      final result = await localDataSource.saveCache(setting);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveLanguageSetting(Language language) async {
    try {
      final result = await localDataSource.setLanguage(language);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveThemeSetting(AppTheme theme) async {
    try {
      final result = await localDataSource.setTheme(theme);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    try {
      final result = await localDataSource.getOnboardingStatus();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> setDoneOnboarding() async {
    try {
      final result = await localDataSource.setDoneOnboarding();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }
}
