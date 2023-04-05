import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../../data_layer/model/item_model/ItemModel.dart';

import '../../../data_layer/model/ingredient_model/IngredientModel.dart';

part 'ItemEntity.g.dart';

@lazySingleton
@freezed
class ItemEntity extends _ItemEntityBase with _$ItemEntity {
  ItemEntity();
  ItemEntity.withParameters({
    required String key,
    String? uri,
    String? label,
    String? image,
    String? url,
    List<String>? ingredientLines,
    List<IngredientModel>? ingredients,
  }) {
    this.key = key;
    this.uri = uri;
    this.label = label;
    this.image = image;
    this.url = url;
    this.ingredientLines = ingredientLines;
    this.ingredients = ingredients;
  }

  factory ItemEntity.fromModel(ItemModel itemModel) {
    return ItemEntity.withParameters(
      key: itemModel.key,
      uri: itemModel.uri,
      label: itemModel.label,
      image: itemModel.image,
      url: itemModel.url,
      ingredientLines: itemModel.ingredientLines,
      ingredients: itemModel.ingredients,
    );
  }

  ItemModel toModel() {
    return ItemModel(
      key: super.key!,
      uri: super.uri,
      label: super.label,
      image: super.image,
      url: super.url,
      ingredientLines: super.ingredientLines,
      ingredients: super.ingredients,

    );
  }
}

abstract class _ItemEntityBase with Store {
  @JsonKey(name: 'key')
  @observable
  String? key;

  @JsonKey(name: 'uri')
  @observable
  String? uri;

  @JsonKey(name: 'label')
  @observable
  String? label;

  @JsonKey(name: 'image')
  @observable
  String? image;

  @JsonKey(name: 'url')
  @observable
  String? url;

  @JsonKey(name: 'ingredientLines')
  @observable
  List<String>? ingredientLines;

  @JsonKey(name: 'ingredients')
  @observable
  List<IngredientModel>? ingredients;


  @action
  void fromModel(ItemModel itemModel) {
    key = itemModel.key;
    uri = itemModel.uri;
    label = itemModel.label;
    image = itemModel.image;
    url = itemModel.url;
    ingredientLines = itemModel.ingredientLines;
    ingredients = itemModel.ingredients;
  }
  
}
