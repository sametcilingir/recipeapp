import 'package:hive/hive.dart';

abstract class BaseLocalDatabaseService {
  HiveObject? getModel({required String key});
  List<HiveObject?>? getFirstModels();
  List<HiveObject?>? getMoreModels({required int skip});
  Future<void> addModel({required HiveObject model});
  Future<void> deleteModel({required HiveObject model});
}
