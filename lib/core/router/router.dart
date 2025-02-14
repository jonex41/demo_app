import 'package:auto_route/auto_route.dart';

import 'package:demo_app/feature/home/view/home_screen.dart';
import 'package:demo_app/feature/login/view/login_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
         AutoRoute(path: '/', page: LoginRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
      ];
}
