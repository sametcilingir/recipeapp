import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../2.1_Main/view/MainView.dart';
import '../../2.2_Search/view/SearchView.dart';
import '../../BaseWidgets/BaseView.dart';
import '../view_model/HomeViewModel.dart';
import 'widgets/bottom_nav_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onViewModelReady: (viewModel) async {
        await viewModel.onViewModelReady();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Observer(builder: (_) {
            return PersistentTabView.custom(
              context,
              controller: viewModel.bottomNavBarController,
              onWillPop: (context) {
                return Future.value(true);
              },
              itemCount: 2,
              screens: const [
                MainView(),
                SearchView(),
              ],
              backgroundColor: Theme.of(context).colorScheme.primary,
              resizeToAvoidBottomInset: true,
              confineInSafeArea: true,
              handleAndroidBackButtonPress: true,
              stateManagement: true,
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              customWidget: BottomNavBarWidget(
                selectedIndex: viewModel.bottomNavBarController.index,
                onItemSelected: (index) {
                  //this is required to update visual state of nav bar
                  setState(() {
                    viewModel.bottomNavBarController.index = index;
                  });
                },
              ),
            );
          }),
        );
      },
    );
  }
}
