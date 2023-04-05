import 'package:mobx/mobx.dart';

import '../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../application_layer/handler/load_handler/LoadHandler.dart';

part 'BaseViewModel.g.dart';

class BaseViewModel = _BaseViewModelBase with _$BaseViewModel;

abstract class _BaseViewModelBase with Store {
  LoadHandler get loadHandler => locator<LoadHandler>();

  @action
  Future<void> onInit() async {
    //print("onInit BaseViewModel");
  }

  @action
  Future<void> onViewModelReady() async {
    //print("onViewModelReady BaseViewModel");
  }

  @action
  Future<void> onDispose() async {
    //print("onDispose BaseViewModel");
  }
}
