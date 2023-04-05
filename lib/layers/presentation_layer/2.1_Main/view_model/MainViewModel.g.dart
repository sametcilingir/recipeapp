// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$itemRefreshControllerAtom =
      Atom(name: '_MainViewModelBase.itemRefreshController', context: context);

  @override
  RefreshController get itemRefreshController {
    _$itemRefreshControllerAtom.reportRead();
    return super.itemRefreshController;
  }

  @override
  set itemRefreshController(RefreshController value) {
    _$itemRefreshControllerAtom.reportWrite(value, super.itemRefreshController,
        () {
      super.itemRefreshController = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_MainViewModelBase.items', context: context);

  @override
  ObservableList<ItemEntity> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemEntity> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isItemLoadingAtom =
      Atom(name: '_MainViewModelBase.isItemLoading', context: context);

  @override
  bool get isItemLoading {
    _$isItemLoadingAtom.reportRead();
    return super.isItemLoading;
  }

  @override
  set isItemLoading(bool value) {
    _$isItemLoadingAtom.reportWrite(value, super.isItemLoading, () {
      super.isItemLoading = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_MainViewModelBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$onViewModelReadyAsyncAction =
      AsyncAction('_MainViewModelBase.onViewModelReady', context: context);

  @override
  Future<void> onViewModelReady() {
    return _$onViewModelReadyAsyncAction.run(() => super.onViewModelReady());
  }

  late final _$onDisposeAsyncAction =
      AsyncAction('_MainViewModelBase.onDispose', context: context);

  @override
  Future<void> onDispose() {
    return _$onDisposeAsyncAction.run(() => super.onDispose());
  }

  late final _$getItemsAsyncAction =
      AsyncAction('_MainViewModelBase.getItems', context: context);

  @override
  Future<void> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  late final _$getItemsMoreAsyncAction =
      AsyncAction('_MainViewModelBase.getItemsMore', context: context);

  @override
  Future<void> getItemsMore() {
    return _$getItemsMoreAsyncAction.run(() => super.getItemsMore());
  }

  late final _$removeFavoriteItemAsyncAction =
      AsyncAction('_MainViewModelBase.removeFavoriteItem', context: context);

  @override
  Future<dynamic> removeFavoriteItem(ItemEntity item) {
    return _$removeFavoriteItemAsyncAction
        .run(() => super.removeFavoriteItem(item));
  }

  @override
  String toString() {
    return '''
itemRefreshController: ${itemRefreshController},
items: ${items},
isItemLoading: ${isItemLoading}
    ''';
  }
}
