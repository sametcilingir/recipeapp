import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'IngredientModel.freezed.dart';
part 'IngredientModel.g.dart';

@freezed
class IngredientModel extends HiveObject with _$IngredientModel {
  IngredientModel._();
  @HiveType(typeId: 1, adapterName: "IngredientModelAdapter")
  factory IngredientModel({
    @HiveField(0) required String key,
    @HiveField(1) String? text,
    @HiveField(2) num? quantity,
    @HiveField(3) String? measure,
    @HiveField(4) String? food,
    @HiveField(5) num? weight,
    @HiveField(6) String? foodCategory,
    @HiveField(7) String? foodId,
    @HiveField(8) String? image,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

  
}
