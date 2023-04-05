// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemEntity.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemEntity on _ItemEntityBase, Store {
  late final _$keyAtom = Atom(name: '_ItemEntityBase.key', context: context);

  @override
  String? get key {
    _$keyAtom.reportRead();
    return super.key;
  }

  @override
  set key(String? value) {
    _$keyAtom.reportWrite(value, super.key, () {
      super.key = value;
    });
  }

  late final _$uriAtom = Atom(name: '_ItemEntityBase.uri', context: context);

  @override
  String? get uri {
    _$uriAtom.reportRead();
    return super.uri;
  }

  @override
  set uri(String? value) {
    _$uriAtom.reportWrite(value, super.uri, () {
      super.uri = value;
    });
  }

  late final _$labelAtom =
      Atom(name: '_ItemEntityBase.label', context: context);

  @override
  String? get label {
    _$labelAtom.reportRead();
    return super.label;
  }

  @override
  set label(String? value) {
    _$labelAtom.reportWrite(value, super.label, () {
      super.label = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ItemEntityBase.image', context: context);

  @override
  String? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$urlAtom = Atom(name: '_ItemEntityBase.url', context: context);

  @override
  String? get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String? value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$ingredientLinesAtom =
      Atom(name: '_ItemEntityBase.ingredientLines', context: context);

  @override
  List<String>? get ingredientLines {
    _$ingredientLinesAtom.reportRead();
    return super.ingredientLines;
  }

  @override
  set ingredientLines(List<String>? value) {
    _$ingredientLinesAtom.reportWrite(value, super.ingredientLines, () {
      super.ingredientLines = value;
    });
  }

  late final _$ingredientsAtom =
      Atom(name: '_ItemEntityBase.ingredients', context: context);

  @override
  List<IngredientModel>? get ingredients {
    _$ingredientsAtom.reportRead();
    return super.ingredients;
  }

  @override
  set ingredients(List<IngredientModel>? value) {
    _$ingredientsAtom.reportWrite(value, super.ingredients, () {
      super.ingredients = value;
    });
  }

  late final _$_ItemEntityBaseActionController =
      ActionController(name: '_ItemEntityBase', context: context);

  @override
  void fromModel(ItemModel itemModel) {
    final _$actionInfo = _$_ItemEntityBaseActionController.startAction(
        name: '_ItemEntityBase.fromModel');
    try {
      return super.fromModel(itemModel);
    } finally {
      _$_ItemEntityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
key: ${key},
uri: ${uri},
label: ${label},
image: ${image},
url: ${url},
ingredientLines: ${ingredientLines},
ingredients: ${ingredients}
    ''';
  }
}
