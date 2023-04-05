// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyAppViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyAppViewModel on _MyAppViewModelBase, Store {
  Computed<ThemeData>? _$themeDarkComputed;

  @override
  ThemeData get themeDark =>
      (_$themeDarkComputed ??= Computed<ThemeData>(() => super.themeDark,
              name: '_MyAppViewModelBase.themeDark'))
          .value;
  Computed<ThemeData>? _$themeComputed;

  @override
  ThemeData get theme =>
      (_$themeComputed ??= Computed<ThemeData>(() => super.theme,
              name: '_MyAppViewModelBase.theme'))
          .value;

  late final _$buildContextAtom =
      Atom(name: '_MyAppViewModelBase.buildContext', context: context);

  @override
  BuildContext? get buildContext {
    _$buildContextAtom.reportRead();
    return super.buildContext;
  }

  @override
  set buildContext(BuildContext? value) {
    _$buildContextAtom.reportWrite(value, super.buildContext, () {
      super.buildContext = value;
    });
  }

  late final _$themeModeAtom =
      Atom(name: '_MyAppViewModelBase.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('_MyAppViewModelBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$onViewModelReadyAsyncAction =
      AsyncAction('_MyAppViewModelBase.onViewModelReady', context: context);

  @override
  Future<void> onViewModelReady() {
    return _$onViewModelReadyAsyncAction.run(() => super.onViewModelReady());
  }

  late final _$onDisposeAsyncAction =
      AsyncAction('_MyAppViewModelBase.onDispose', context: context);

  @override
  Future<void> onDispose() {
    return _$onDisposeAsyncAction.run(() => super.onDispose());
  }

  late final _$_MyAppViewModelBaseActionController =
      ActionController(name: '_MyAppViewModelBase', context: context);

  @override
  dynamic of(BuildContext context) {
    final _$actionInfo = _$_MyAppViewModelBaseActionController.startAction(
        name: '_MyAppViewModelBase.of');
    try {
      return super.of(context);
    } finally {
      _$_MyAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatusBarBrightness(Brightness brightness) {
    final _$actionInfo = _$_MyAppViewModelBaseActionController.startAction(
        name: '_MyAppViewModelBase.changeStatusBarBrightness');
    try {
      return super.changeStatusBarBrightness(brightness);
    } finally {
      _$_MyAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buildContext: ${buildContext},
themeMode: ${themeMode},
themeDark: ${themeDark},
theme: ${theme}
    ''';
  }
}
