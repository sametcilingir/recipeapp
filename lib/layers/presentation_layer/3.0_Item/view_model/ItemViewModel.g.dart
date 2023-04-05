// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemViewModel on _ItemViewModelBase, Store {
  late final _$paramsAtom =
      Atom(name: '_ItemViewModelBase.params', context: context);

  @override
  Object? get params {
    _$paramsAtom.reportRead();
    return super.params;
  }

  @override
  set params(Object? value) {
    _$paramsAtom.reportWrite(value, super.params, () {
      super.params = value;
    });
  }

  late final _$extraAtom =
      Atom(name: '_ItemViewModelBase.extra', context: context);

  @override
  Object? get extra {
    _$extraAtom.reportRead();
    return super.extra;
  }

  @override
  set extra(Object? value) {
    _$extraAtom.reportWrite(value, super.extra, () {
      super.extra = value;
    });
  }

  late final _$itemAtom =
      Atom(name: '_ItemViewModelBase.item', context: context);

  @override
  ItemEntity? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(ItemEntity? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$itemImageAtom =
      Atom(name: '_ItemViewModelBase.itemImage', context: context);

  @override
  String? get itemImage {
    _$itemImageAtom.reportRead();
    return super.itemImage;
  }

  @override
  set itemImage(String? value) {
    _$itemImageAtom.reportWrite(value, super.itemImage, () {
      super.itemImage = value;
    });
  }

  late final _$isItemFavoriteAtom =
      Atom(name: '_ItemViewModelBase.isItemFavorite', context: context);

  @override
  bool get isItemFavorite {
    _$isItemFavoriteAtom.reportRead();
    return super.isItemFavorite;
  }

  @override
  set isItemFavorite(bool value) {
    _$isItemFavoriteAtom.reportWrite(value, super.isItemFavorite, () {
      super.isItemFavorite = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_ItemViewModelBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$onViewModelReadyAsyncAction =
      AsyncAction('_ItemViewModelBase.onViewModelReady', context: context);

  @override
  Future<void> onViewModelReady() {
    return _$onViewModelReadyAsyncAction.run(() => super.onViewModelReady());
  }

  late final _$onDisposeAsyncAction =
      AsyncAction('_ItemViewModelBase.onDispose', context: context);

  @override
  Future<void> onDispose() {
    return _$onDisposeAsyncAction.run(() => super.onDispose());
  }

  late final _$getItemAsyncAction =
      AsyncAction('_ItemViewModelBase.getItem', context: context);

  @override
  Future<dynamic> getItem() {
    return _$getItemAsyncAction.run(() => super.getItem());
  }

  late final _$addFavoriteItemAsyncAction =
      AsyncAction('_ItemViewModelBase.addFavoriteItem', context: context);

  @override
  Future<dynamic> addFavoriteItem() {
    return _$addFavoriteItemAsyncAction.run(() => super.addFavoriteItem());
  }

  late final _$removeFavoriteItemAsyncAction =
      AsyncAction('_ItemViewModelBase.removeFavoriteItem', context: context);

  @override
  Future<dynamic> removeFavoriteItem() {
    return _$removeFavoriteItemAsyncAction
        .run(() => super.removeFavoriteItem());
  }

  late final _$checkItemFavoriteAsyncAction =
      AsyncAction('_ItemViewModelBase.checkItemFavorite', context: context);

  @override
  Future<dynamic> checkItemFavorite() {
    return _$checkItemFavoriteAsyncAction.run(() => super.checkItemFavorite());
  }

  late final _$_ItemViewModelBaseActionController =
      ActionController(name: '_ItemViewModelBase', context: context);

  @override
  dynamic setParamsORExtra(Object? params, Object? extra) {
    final _$actionInfo = _$_ItemViewModelBaseActionController.startAction(
        name: '_ItemViewModelBase.setParamsORExtra');
    try {
      return super.setParamsORExtra(params, extra);
    } finally {
      _$_ItemViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
params: ${params},
extra: ${extra},
item: ${item},
itemImage: ${itemImage},
isItemFavorite: ${isItemFavorite}
    ''';
  }
}
