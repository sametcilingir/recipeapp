// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$bottomNavBarControllerAtom =
      Atom(name: '_HomeViewModelBase.bottomNavBarController', context: context);

  @override
  PersistentTabController get bottomNavBarController {
    _$bottomNavBarControllerAtom.reportRead();
    return super.bottomNavBarController;
  }

  @override
  set bottomNavBarController(PersistentTabController value) {
    _$bottomNavBarControllerAtom
        .reportWrite(value, super.bottomNavBarController, () {
      super.bottomNavBarController = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_HomeViewModelBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$onViewModelReadyAsyncAction =
      AsyncAction('_HomeViewModelBase.onViewModelReady', context: context);

  @override
  Future<void> onViewModelReady() {
    return _$onViewModelReadyAsyncAction.run(() => super.onViewModelReady());
  }

  late final _$onDisposeAsyncAction =
      AsyncAction('_HomeViewModelBase.onDispose', context: context);

  @override
  Future<void> onDispose() {
    return _$onDisposeAsyncAction.run(() => super.onDispose());
  }

  @override
  String toString() {
    return '''
bottomNavBarController: ${bottomNavBarController}
    ''';
  }
}
