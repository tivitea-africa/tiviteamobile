// ignore_for_file: strict_raw_type

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/storage_keys.dart';
import 'package:tivi_tea/core/utils/logger.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl(this.box);
  final Box box;
  @override
  Future<void> put(dynamic key, dynamic value) async {
    return await box.put(key, value);
  }

  @override
  dynamic get<T>(String key) {
    return box.get(key);
  }

  @override
  dynamic getAt(int key) {
    return box.getAt(key);
  }

  @override
  Future<int> add(dynamic value) {
    return box.add(value);
  }

  @override
  Future<void> clear() async {
    await box.clear();
    await Hive.initFlutter();
    debugLog("Box length => ${box.length}");
  }

  @override
  Future<void> delete(dynamic value) async {
    return await box.delete(value);
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    return await box.putAll(entries);
  }
}

final localDB = Provider<LocalStorage>(
  (ref) => LocalStorageImpl(Hive.box(HiveKeys.appBox)),
);
