// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  late final _$recipeNameControllerAtom =
      Atom(name: '_SearchViewModelBase.recipeNameController', context: context);

  @override
  TextEditingController get recipeNameController {
    _$recipeNameControllerAtom.reportRead();
    return super.recipeNameController;
  }

  @override
  set recipeNameController(TextEditingController value) {
    _$recipeNameControllerAtom.reportWrite(value, super.recipeNameController,
        () {
      super.recipeNameController = value;
    });
  }

  late final _$ingredientsControllerAtom = Atom(
      name: '_SearchViewModelBase.ingredientsController', context: context);

  @override
  TextEditingController get ingredientsController {
    _$ingredientsControllerAtom.reportRead();
    return super.ingredientsController;
  }

  @override
  set ingredientsController(TextEditingController value) {
    _$ingredientsControllerAtom.reportWrite(value, super.ingredientsController,
        () {
      super.ingredientsController = value;
    });
  }

  late final _$itemRefreshControllerAtom = Atom(
      name: '_SearchViewModelBase.itemRefreshController', context: context);

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
      Atom(name: '_SearchViewModelBase.items', context: context);

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
      Atom(name: '_SearchViewModelBase.isItemLoading', context: context);

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

  late final _$groupButtonControllerAtom = Atom(
      name: '_SearchViewModelBase.groupButtonController', context: context);

  @override
  GroupButtonController get groupButtonController {
    _$groupButtonControllerAtom.reportRead();
    return super.groupButtonController;
  }

  @override
  set groupButtonController(GroupButtonController value) {
    _$groupButtonControllerAtom.reportWrite(value, super.groupButtonController,
        () {
      super.groupButtonController = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_SearchViewModelBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$onViewModelReadyAsyncAction =
      AsyncAction('_SearchViewModelBase.onViewModelReady', context: context);

  @override
  Future<void> onViewModelReady() {
    return _$onViewModelReadyAsyncAction.run(() => super.onViewModelReady());
  }

  late final _$onDisposeAsyncAction =
      AsyncAction('_SearchViewModelBase.onDispose', context: context);

  @override
  Future<void> onDispose() {
    return _$onDisposeAsyncAction.run(() => super.onDispose());
  }

  late final _$getSearchItemsAsyncAction =
      AsyncAction('_SearchViewModelBase.getSearchItems', context: context);

  @override
  Future<dynamic> getSearchItems() {
    return _$getSearchItemsAsyncAction.run(() => super.getSearchItems());
  }

  late final _$getSearchItemsMoreAsyncAction =
      AsyncAction('_SearchViewModelBase.getSearchItemsMore', context: context);

  @override
  Future<dynamic> getSearchItemsMore() {
    return _$getSearchItemsMoreAsyncAction
        .run(() => super.getSearchItemsMore());
  }

  late final _$addFavoriteItemAsyncAction =
      AsyncAction('_SearchViewModelBase.addFavoriteItem', context: context);

  @override
  Future<dynamic> addFavoriteItem(ItemEntity item) {
    return _$addFavoriteItemAsyncAction.run(() => super.addFavoriteItem(item));
  }

  @override
  String toString() {
    return '''
recipeNameController: ${recipeNameController},
ingredientsController: ${ingredientsController},
itemRefreshController: ${itemRefreshController},
items: ${items},
isItemLoading: ${isItemLoading},
groupButtonController: ${groupButtonController}
    ''';
  }
}
