// ignore_for_file: strict_raw_type

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/storage_keys.dart';
import 'package:tivi_tea/core/utils/logger.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl(this.boxName);
  final String boxName;

  Box get box => Hive.box(boxName);

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
    try {
      final currentBox = Hive.box(boxName);
      await currentBox.clear();
      await currentBox.close();
      await Hive.deleteBoxFromDisk(boxName);

      await Hive.openBox(boxName);
      debugLog("Box cleared, deleted, and reopened successfully");
    } catch (e) {
      debugLog("Error clearing box: $e");
    }
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
  (ref) => LocalStorageImpl(HiveKeys.appBox),
);
