import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

abstract class AuthLocalDataSource implements CacheDataSource<TokenModel?> {}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.hive);

  final HiveInterface hive;

  @override
  String cacheKey = 'AUTH_DATA_SOURCE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box?.clear();

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<TokenModel?> getData() async {
    try {
      final box = await _getBox();
      final boxData = box?.get('data');
      if (boxData != null && boxData is String) {
        return TokenModel.fromJson(json.decode(boxData));
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();

      return box?.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> saveCache(TokenModel? data) async {
    try {
      final box = await _getBox();

      await box?.put('data', json.encode(data?.toJson()));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<Box<Object?>?> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }
}
