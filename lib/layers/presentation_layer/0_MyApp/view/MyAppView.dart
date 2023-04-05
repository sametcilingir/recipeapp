library my_app;

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../application_layer/constant/StringConstant.dart';
import '../../BaseWidgets/BaseView.dart';
import '../view_model/MyAppViewModel.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MyAppViewModel>(
      onViewModelReady: (viewModel) async {
        await viewModel.onViewModelReady();
        viewModel.of(context);
      },
      builder: (context, viewModel, child) {
        return Observer(
          builder: (_) {
            return RefreshConfiguration(
              headerBuilder: () => ClassicHeader(),
              footerBuilder: () => ClassicFooter(),
              headerTriggerDistance: 80.0,
              springDescription: SpringDescription(
                stiffness: 170,
                damping: 16,
                mass: 1.9,
              ),
              maxOverScrollExtent: 100,
              maxUnderScrollExtent: 0,
              enableScrollWhenRefreshCompleted: true,
              enableLoadingWhenFailed: true,
              hideFooterWhenNotFull: false,
              enableBallisticLoad: true,
              child: MaterialApp.router(
                //
                title: StringConstant.APP_NAME,
                debugShowCheckedModeBanner: false,

                //loading
                builder: EasyLoading.init(),

                //theme
                theme: viewModel.theme,
                themeMode: viewModel.themeMode,
                darkTheme: viewModel.themeDark,

                //route
                routeInformationParser: viewModel.routeHandler.globalRoutes.routeInformationParser,
                routerDelegate: viewModel.routeHandler.globalRoutes.routerDelegate,
                routeInformationProvider:
                    viewModel.routeHandler.globalRoutes.routeInformationProvider,
              ),
            );
          },
        );
      },
    );
  }
}
