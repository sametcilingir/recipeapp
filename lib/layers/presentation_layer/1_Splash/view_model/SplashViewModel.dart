import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../BaseWidgets/BaseViewModel.dart';

part 'SplashViewModel.g.dart';

@lazySingleton
class SplashViewModel extends _SplashViewModelBase with _$SplashViewModel {}

abstract class _SplashViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit SplashViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    super.onViewModelReady();
    print("onViewModelReady SplashViewModel");
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose SplashViewModel");
    super.onDispose();
  }
}
