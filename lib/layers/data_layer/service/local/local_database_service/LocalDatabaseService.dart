import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'base/BaseLocalDatabaseService.dart';

@injectable
class LocalDatabaseService extends BaseLocalDatabaseService {
  LocalDatabaseService(
    @factoryParam this._boxName,
  ) {
    _box = Hive.box<HiveObject>(_boxName);
  }

  final String _boxName;
  Box<HiveObject>? _box;

  int get userBoxLenght => _box!.length;

  @override
  HiveObject? getModel({required String key}) {
    try {
      return _box?.get(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<HiveObject?>? getFirstModels() {
    try {
      final list = _box?.values.toList();
      var newList = list?.take(15).toList();
      return newList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<HiveObject?>? getMoreModels({required int skip}) {
    try {
      final list = _box?.values.toList();
      var newList = list?.skip(skip).take(10).toList();
      return newList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addModel({required HiveObject model}) async {
    try {
      await _box?.put(
        model.key,
        model,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteModel({required HiveObject model}) async {
    try {
      await _box?.delete(model.key);
    } catch (e) {
      rethrow;
    }
  }
}
