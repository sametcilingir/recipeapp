import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../ingredient_model/IngredientModel.dart';

part 'ItemModel.freezed.dart';
part 'ItemModel.g.dart';

@freezed
class ItemModel extends HiveObject with _$ItemModel {
  ItemModel._();
  @HiveType(typeId: 0, adapterName: "ItemModelAdapter")
  factory ItemModel({
    @HiveField(0) required String key,
    @HiveField(1) String? uri,
    @HiveField(2) String? label,
    @HiveField(3) String? image,
    @HiveField(4) String? url,
    @HiveField(5) List<String>? ingredientLines,
    @HiveField(6) List<IngredientModel>? ingredients,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
}
