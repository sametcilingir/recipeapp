import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../../application_layer/handler/route_handler/RouteHandler.dart';
import '../../../application_layer/handler/theme_handler/ThemeHandler.dart';
import '../../BaseWidgets/BaseViewModel.dart';

part 'MyAppViewModel.g.dart';

@lazySingleton
class MyAppViewModel = _MyAppViewModelBase with _$MyAppViewModel;

abstract class _MyAppViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit MyAppViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    super.onViewModelReady();
    print("onViewModelReady MyAppViewModel");
    changeStatusBarBrightness(
      SchedulerBinding.instance.window.platformBrightness == Brightness.light
          ? Brightness.light
          : Brightness.dark,
    );
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose MyAppViewModel");
    super.onDispose();
  }

  @action
  of(BuildContext context) {
    buildContext = context;
  }

  @observable
  BuildContext? buildContext;

  ThemeHandler get themeHandler => locator<ThemeHandler>();
  RouteHandler get routeHandler => locator<RouteHandler>();

  @observable
  ThemeMode themeMode = SchedulerBinding.instance.window.platformBrightness == Brightness.light
      ? ThemeMode.light
      : ThemeMode.dark;

  @computed
  ThemeData get themeDark => themeHandler.themeDark;

  @computed
  ThemeData get theme =>
      themeMode == ThemeMode.light ? themeHandler.themeLight : themeHandler.themeDark;

  @action
  void changeStatusBarBrightness(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: brightness,
      ),
    );
  }
}
