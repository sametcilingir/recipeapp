import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../BaseWidgets/BaseViewModel.dart';

part 'HomeViewModel.g.dart';

@lazySingleton
class HomeViewModel extends _HomeViewModelBase with _$HomeViewModel {}

abstract class _HomeViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit HomeViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    print("onViewModelReady HomeViewModel");
    super.onViewModelReady();
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose HomeViewModel");
    super.onDispose();
  }

  @observable
  PersistentTabController bottomNavBarController = PersistentTabController(initialIndex: 0);

}
