import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation_layer/1_Splash/view/SplashView.dart';
import '../../../presentation_layer/2_Home/view/HomeView.dart';
import '../../../presentation_layer/3.0_Item/view/ItemView.dart';
import 'constant/RouteConstant.dart';

@lazySingleton
class RouteHandler {
  final globalRoutes = GoRouter(
    initialLocation: RouteConstant.SPLASH,
    routes: [
      GoRoute(
        path: RouteConstant.SPLASH,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RouteConstant.HOME,
        builder: (context, state) => const HomeView(),
      ),
      /*GoRoute(
        path: RouteConstant.MAIN,
        builder: (context, state) => const MainView(),
      ),*/
      /*GoRoute(
        path: RouteConstant.SEARCH,
        builder: (context, state) => const SearchView(),
      ),*/
      GoRoute(
        path: "${RouteConstant.ITEM}/:itemId",
        builder: (context, state) => ItemView(
          params: state.params['itemId'],
          extra: state.extra,
        ),
      ),
    ],
  );
}
