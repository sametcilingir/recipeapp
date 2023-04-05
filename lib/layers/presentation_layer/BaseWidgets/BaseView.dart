import 'package:flutter/material.dart';

import '../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import 'BaseViewModel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.onViewModelReady,
    required this.builder,
  }) : super(key: key);

  final void Function(T viewModel) onViewModelReady;
  final Widget Function(BuildContext context, T viewModel, Widget child) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = locator<T>();


  @override
  void initState() {
    print('initState ${viewModel.runtimeType.toString().replaceAll('Model', '')}');
    viewModel.onInit();

    widget.onViewModelReady(viewModel);

    super.initState();
  }

  @override
  void dispose() {
    print('dispose ${viewModel.runtimeType.toString().replaceAll('Model', '')}');
    viewModel.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      viewModel,
      const SizedBox.shrink(),
    );
  }
}
