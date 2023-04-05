import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../application_layer/constant/StringConstant.dart';
import '../../../application_layer/handler/route_handler/constant/RouteConstant.dart';
import '../../BaseWidgets/BaseView.dart';
import '../view_model/SplashViewModel.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(onViewModelReady: (viewModel) async {
      await viewModel.onViewModelReady();
      await Future.delayed(
        const Duration(seconds: 1),
        () => context.go(RouteConstant.HOME),
      );
    }, builder: (context, viewModel, child) {
      return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                ),
                Icon(
                  Icons.receipt,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  StringConstant.APP_NAME,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Easily take recipts',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
