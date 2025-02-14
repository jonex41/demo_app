import 'package:auto_route/auto_route.dart';

import 'package:demo_app/feature/home/view/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(path: '/', page: StartRoute.page),
        AutoRoute(path: '/', page: HomeRoute.page),
      ];
}
